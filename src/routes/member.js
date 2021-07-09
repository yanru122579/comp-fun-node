//會員api路由
const express = require("express");
const router = express.Router();

// SQL
const User = require(__dirname + "/../models/Member");

// 連接資料庫
const db = require(__dirname + "/../modules/mysql2-connect");

// 上傳大頭貼
const upload = require(__dirname + "/../modules/upload-img");


// 執行sql用的async-await的函式
// sql 執行用的sql
// res 回應
// method restful的方法，預設為get
// multirow 是否為多資料回傳，預設為是
// instance 物件實體，預設為空物件

async function executeSQL(
  sql,
  res,
  method = 'get',
  multirows = true,
  instance = {}
) {
  try {
    const [rows, fields] = await db.query(sql)

    switch (method) {
      case 'post': {
        // 仿照json-server的回傳
        const insertId = { id: rows.insertId }
        // 合併id值
        const result = { ...instance, ...insertId }
        //回傳
        res.status(200).json(result)
        break
      }
      case 'put': {
        // 仿照json-server的回傳，有更新到會回傳單一值，沒找到會回到空的物件字串
        // console.log(rows.affectedRows)
        let result = {}
        if (rows.affectedRows) result = { ...instance }
        //回傳
        res.status(200).json(result)
        break
      }
      case 'delete': {
        // 仿照json-server的回傳
        res.status(200).json({})
        break
      }
      case 'get':
      default:
        {
          if (multirows) {
            // res.status(200).json({
            //   users: rows,
            // })
            res.status(200).json(rows)
          } else {
            // 仿照json-server的回傳，有找到會回傳單一值，沒找到會回到空的物件字串
            let result = {}
            if (rows.length) result = rows[0]
            res.status(200).json(result)
          }
        }
        break
    }
  } catch (error) {
    // 錯誤處理
    console.log(error)

    // 顯示錯誤於json字串
    res.status(200).json({
      message: error,
    })
  }
}

// instance 物件實體，預設為空物件
async function userLogin(sql, req, res, instance) {
  try {
    const data = { success: false, message: { type: 'danger', text: '' } };
    const [rows, fields] = await db.query(sql)

    let result = {}

    if (rows.length) {
      result = rows[0]
      console.log(result)

      req.session.regenerate(function (err) {
        if (err) {
          res.status(200).json({ status: 2, message: '登入失敗' })
        }
        data.success = true;
        data.message.text = '有找到資料'
        data.mId = result.mId
        data.email = result.email

        const {mId, email} = result
        req.session.member = {mId, email}

        console.log(req.session)
        // 回應前端，我的自訂資料、伺服器搜索結果
        res.status(200).json(data)
      })
    } else {
      data.message.text = '沒找到相符資料'
      res.status(200).json(data)
    }
  } catch (error) {
    // 錯誤處理
    console.log(error)
    // 顯示錯誤於json字串
    res.status(200).json({
      message: error,
    })
  }
}

// // 判斷是否登入
// router.get("/login", (req, res) => {
//   console.log(req.session)
//   if (req.session.loginMId) {
//     res.redirect("/");  //如果已經登入就跳轉回首頁
//   } else {
//     res.redirect("/");
//   }
// });

// 處理會員登入
router.post('/login', function (req, res, next) {
  let user = new User(
    req.body.mId,
    req.body.email,
    req.body.password,
  )

  // 回應都寫在userLogin方法裡(async-await)
  userLogin(user.getUserUserByUsernameAndPasswordSQL(), req, res, user)
})


// 處理會員登出
router.get('/logout', function (req, res, next) {
  req.session.destroy(function (err) {
    if (err) {
      res.status(200).json({ status: 1, message: '登出失敗' })
      return
    }

    // 清除所有的session
    req.session = null

    res.clearCookie('skey')
    res.status(200).json({ status: 0, message: '登出成功' })
  })
})

// 檢查是否登入
router.get('/checklogin', function (req, res, next) {
  const sess = req.session

  const id = sess.loginId
  const username = sess.loginUsername
  const name = sess.loginName
  const email = sess.loginEmail
  const createDate = sess.loginCreatedDate

  const isLogined = !!name

  if (isLogined) {
    res.status(200).json({ id, name, username, email, createDate })
  } else {
    // 登出狀態時回傳`{id:0}`
    res.status(200).json({ id: 0 })
  }
})

// 新增會員
router.post('/register', (req, res, next) => {
  // 測試response，會自動解析為物件
  // console.log(typeof req.body)
  // console.log(req.body)

  //從request json 資料建立新的物件
  let user = new User(
    req.body.mId,
    req.body.email,
    req.body.password
  )

  executeSQL(user.addUserSQL(), res, 'post', false, user)
})


// 顯示大頭貼
router.get("/try-upload", (req, res) => {
  res.render("try-upload");
});

// 上傳大頭貼
router.post("/try-upload", upload.single("avatar"), async (req, res) => {
  console.log(req.file);
  
  // let newName = '';
  // if(extMap[req.file.mimetype]){
    //     newName = uuidv4() + extMap[req.file.mimetype];
    //     await fs.promises.rename(req.file.path, './public/img/' + newName);
    // }
    
    res.json({
      filename: req.file && req.file.filename,
      body: req.body,
    });
  });

  
// get 讀取單一會員資料
router.get('/userdata/:userId', (req, res, next) => {
  console.log(req.params.userId)
  executeSQL(User.getUserByIdSQL(req.params.userId), res, 'get', false)
})

// put 更新單一會員資料
router.put('/userdata/:userId', (req, res) => {
  console.log(req.body.lName)
  let user = new User(
    id = '',
    email = '',
    password = '',
    fName = req.body.fName,
    lName = req.body.lName,
    nickName = req.body.nickName,
    birthday = req.body.birthday,
    phone = req.body.phone,
    gender = req.body.gender,
  )

  // id值為數字
  user.id = +req.params.userId

  executeSQL(user.updateUserByIdSQL(req.params.userId), res, 'put', false, user)
})



// 測試用
router.get("/try-sess", (req, res) => {
  req.session.my_var = req.session.my_var || 0; //預設為0
  req.session.my_var++;
  res.json({
    my_var: req.session.my_var,
    session: req.session,
  });
});

router.get("/", async (req, res) => {
  res.json(Member.getTest(req.url));
});

module.exports = router;
