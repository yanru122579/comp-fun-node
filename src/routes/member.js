// require("dotenv").config();
//會員api路由
const express = require("express");
const router = express.Router();

// SQL
const User = require(__dirname + "/../models/Member");

// 連接資料庫
const db = require(__dirname + "/../modules/mysql2-connect");

// 上傳大頭貼
const upload = require(__dirname + "/../modules/upload-img");

// 加密
const bcryptjs =require('bcryptjs');
// jsonwebtoken
const jwt =require('jsonwebtoken');

// nodemailer
const nodemailer = require('nodemailer')


// 把JSONwebtoken放進檔頭
router.use((req, res, next) => {
  // res.locals = {
  //     email: '全域的middleware email',
  //     password: '全域的middleware password'
  // }
  res.locals.admin = req.session.admin || {}; //把登入的管理者資料放進locals

  req.bearer = null; // 自訂屬性
  let auth = req.get('Authorization');
  // console.log(auth)
  if(auth && auth.indexOf('Bearer ') ===0){
    auth = auth.slice(7);
    // console.log(auth)
    try{
        req.bearer =  jwt.verify(auth, process.env.TOKEN_SECRECT);
    }catch(ex){
      req.bearer = false;
      console.log(ex);
    }
  }
  next();
});



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
        console.log(result)
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
async function userLogin(sql, req, res, userPassword) {

    const data = {
      success: false,
      message: '沒有 account 或沒有 password 欄位',
      email:false,
    };
    
    const [rows] = await db.query(sql)

    let result = {}

    if (rows.length < 1) {
      data.message= '帳號或密碼錯誤(帳號)'
      return res.status(200).json(data)
    }

    result = rows[0]
    console.log(result,userPassword,result.password)

    bcryptjs.compare(userPassword,result.password,function(err,compareResult){
      console.log(compareResult)
      if(!compareResult ){
        data.message = '帳號或密碼錯誤(密碼)'
        return res.status(405).json(data)
      }
      data.success = true
      data.message = '登入成功'
      const {mId, email, fName, lName,nickname, phone, avatar} = result

      data.mId = mId
      data.token = jwt.sign({mId, email, fName, lName,nickname, phone ,avatar}, process.env.TOKEN_SECRECT)

      data.information = {email,nickname,avatar}
      // 這段可以測試解密
      // console.log(jwt.verify(auth, process.env.TOKEN_SECRECT ))

      res.status(200).json(data)
    })
}
// 修改密碼用
async function checkPassword(sql, req, res,userPassword,userNewPassword,user,mId) {

    const data = {
      success: false,
      message: '初始錯誤訊息'
    };
    
    const [rows] = await db.query(sql)

    let result = {}

    if (rows.length < 1) {
      data.message= '未找到相對應帳號'
      return res.status(200).json(data)
    }

    result = rows[0]
    // console.log(result,userPassword,result.password)

    bcryptjs.compare(userPassword,result.password,function(err,compareResult){
      console.log(compareResult)
      if(!compareResult ){
        data.message = '密碼錯誤'
        return res.status(405).json(data)
      }
      data.success = true;
      data.message = '密碼正確'
      console.log(mId)
      bcryptjs.hash(userNewPassword,10,function(err,hash){

      executeSQL(user.putPasswordSQL(mId,hash), res, 'put', false, user)
      })
    })
}

async function registerGiveCoupon(
  sql, 
  res, 
  method = 'get',
  multirows = true, 
  instance = {}
  ){
  const [rows, fields] = await db.query(sql)
  const insertId = { id: rows.insertId }
  const result = { ...instance, ...insertId }
  console.log(result)
  let mId = result.id
  let user = new User()
  executeSQL(user.CouponSQL(mId), res, 'post', false, user)
}




// 處理會員登入
router.post('/login', function (req, res, next) {
  
  let user = new User(
    req.body.mId,
    req.body.email,
    req.body.password,
  )
  const userPassword = req.body.password
  // 回應都寫在userLogin方法裡(async-await)
  userLogin(user.getUserUserByUsernameAndPasswordSQL(), req, res,userPassword)
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

// 新增會員
router.post('/register', (req, res, next) => {

  // let password = ''
  bcryptjs.hash(req.body.password,10,function(err,hash){
    let user = new User(
      req.body.mId,
      req.body.email,
      hash
    )
    registerGiveCoupon(user.addUserSQL(), res, 'post', false, user)
  })
})



// 上傳大頭貼
router.put("/avatarUpload", upload.single("avatar"), async (req, res) => {
  console.log(req.file);
  console.log(req.bearer);

  let mId = req.bearer.mId
  let user = new User(
    id = 0,
    email = '',
    password = '',
    fName = req.body.fName,
    lName = req.body.lName,
    nickname = req.body.nickname,
    birthday = req.body.birthday,
    phone = req.body.phone,
    gender = req.body.gender,
    avatar = req.file.filename
  )
    
    // id值為數字
  user.id = +req.bearer.mId

  executeSQL(user.updateUserAvatarByIdSQL(mId), res, 'put', false, user)
  });

  
// get 讀取單一會員資料
router.get('/userdata/', (req, res, next) => {
  // console.log(req.bearer)
  let mId = req.bearer.mId
  executeSQL(User.getUserByIdSQL(mId), res, 'get', false)
})

// put 更新單一會員資料
router.put('/userdata/', (req, res) => {
  // console.log(req.bearer.mId)
  console.log(req.body)
  let mId = req.bearer.mId
  let user = new User(
    id = 0,
    email = req.bearer.email,
    password = '',
    fName = undefined || req.body.fName,
    lName = undefined || req.body.lName,
    nickname = undefined || req.body.nickname,
    birthday = req.body.birthday,
    phone = undefined || req.body.phone,
    gender = req.body.gender,
    avatar = req.bearer.avatar
  )

  // id值為數字
  // user.id = +req.bearer.mId

  executeSQL(user.updateUserByIdSQL(mId), res, 'put', false, user)
})

// 修改登入密碼
router.post('/editPassword', (req, res, next) => {
  // console.log(req.bearer.mId)
  // console.log(req.body)

  let mId = req.bearer.mId
  let user = new User(
    id = 0,
    email = req.bearer.email,
    password = req.body.password,
    fName = req.body.fName,
    lName = req.body.lName,
    nickname = req.body.nickname,
    birthday = req.body.birthday,
    phone = req.body.phone,
    gender = req.body.gender,
    avatar = req.bearer.avatar,
    country = req.body.country,
    township = req.body.township,
    naa = req.body.naa,
    newPassword = req.body.newPassword
  )
  const userPassword = req.body.password
  const userNewPassword = req.body.newPassword
  // id值為數字
  mId = req.bearer.mId
  // console.log(user)
  checkPassword(user.getPasswordSQL(mId), res,res,userPassword,userNewPassword,user,mId)
})

// 解析token
router.get('/verifyMemberData',(req,res)=>{
  res.json({
    headers : req.headers,
    bearer: req.bearer,
  });
})

// 地址: 讀取單一會員地址
router.get('/addressbook', (req, res, next) => {

  console.log(req.bearer)
  let mId = req.bearer.mId
  executeSQL(User.getUserAddressByIdSQL(mId), res, 'get', true)
})


// 地址: 新增地址
router.post('/addressbook', (req, res, next) => {
  // 測試response，會自動解析為物件
  // console.log(typeof req.body)
  console.log(req.body)

  let mId = req.bearer.mId
  let user = new User(
    id = 0,
    email = req.bearer.email,
    password = '',
    fName = req.body.fName,
    lName = req.body.lName,
    nickname = req.body.nickname,
    birthday = req.body.birthday,
    phone = req.body.phone,
    gender = req.body.gender,
    avatar = req.bearer.avatar,
    country = req.body.country,
    township = req.body.township,
    naa = req.body.naa
  )

  console.log(user)
  executeSQL(user.addAdressSQL(mId), res, 'post', false, user)
})

// 地址: 修改地址
router.put('/addressbook', (req, res, next) => {
  // 測試response，會自動解析為物件
  // console.log(typeof req.body)
  console.log(req.body)

  let mId = req.bearer.mId
  let user = new User(
    id = 0,
    email = req.bearer.email,
    password = '',
    fName = req.body.fName,
    lName = req.body.lName,
    nickname = req.body.nickname,
    birthday = req.body.birthday,
    phone = req.body.phone,
    gender = req.body.gender,
    avatar = req.bearer.avatar,
    country = req.body.country,
    township = req.body.township,
    naa = req.body.naa
  )
    let addressId = req.body.addressId
  console.log(user)
  executeSQL(user.updateAdressSQL(addressId), res, 'put', false, user)
})

//delete 刪除一筆資料
router.delete('/address/:addressId', (req, res, next) => {
  executeSQL(User.deleteUserByIdSQL(req.params.addressId), res, 'delete', false)
})

// 遺失密碼，1.寄送忘記密碼信件
router.post('/losepassword',async (req, res, next) => {

  let email = req.body.email
const nodemailer = require('nodemailer');


let transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'campfun789@gmail.com',
        pass: 'ejulaemnttskemhz'
    }
});

// 製作隨機驗證碼
function getRandomInt(max) {
  return Math.floor(Math.random() * max);
}
const otg = getRandomInt(999999)
console.log(otg)
// 寫入會員資料庫
let sql = `UPDATE member  \
SET otg = '${otg}' WHERE email = '${email}'`

const [rows] = await db.query(sql)
console.log[rows]

// setup email data with unicode symbols
let mailOptions = {
    from: 'campfun789@gmail.com', // sender address
    to: email, // list of receivers
    subject: '露營趣，找回您遺失的登入密碼。', // Subject line
    // text: 'Hello world ?', // plain text body
    html: `<h4>親愛的 ${email} 您好：</h4>
    <p>我們已收到你的 露營趣 Campfun 密碼重設要求。
    輸入以下驗證碼重設確認碼：</p><div style="border:2px solid #aaf;margin-left:200px;width:100px;text-align: center;" ><h2>${otg}</h2></div>，登入密碼畫面後請使用新密碼進行登入。為確保您使用安全，請於30分鐘內完成登入密碼設定變更。</p><p>你並沒有要求更改密碼？如果你並未要求新密碼，請通知我們。</p>`
    
};
let output = {
  success:false,
  message: '',
}
// send mail with defined transport object
transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      output.message = '寄信失敗'
      res.status(200).json(output);
    }
    console.log('Message %s sent: %s', info.messageId, info.response);
    output.success = true
    output.message = '寄信成功'
    res.status(200).json(output)
}); 
})

// 遺失密碼，2.檢查驗證碼。
router.post('/checkotg',async (req, res, next) => {

  const email = req.body.email
  const otg = req.body.otg
// 寫入會員資料庫
let sql = `SELECT * FROM member  \
WHERE email = '${email}' AND otg = '${otg}'`

const [rows] = await db.query(sql)
console.log(rows)
const result = rows[0]
let output={success:false, message:'驗證碼錯誤'}
if(!rows.length){
    res.status(200).json(output)
  } else{
    output.success=true
    output.message='驗證成功'
    res.status(200).json(output)
  }
})

// 遺失密碼，3.更改新密碼。
router.post('/findLostPwd',async (req, res, next) => {
  console.log(req.body)
  const email = req.body.email
  const newPwd = req.body.newPwd

  bcryptjs.hash(newPwd,10,async function(err,hash){

    // 寫入會員資料庫
    let sql = `UPDATE member  \
    SET password = '${hash}'
    WHERE email = '${email}'`
    const [rows] = await db.query(sql)
    console.log[rows]
    res.status(200).json(rows)
  })
})

// 線上客服 用戶端:　發送訊息
router.post('/sendMessage',async (req, res, next) => {
  console.log(req.body)
  console.log(req.bearer)
  const mId = req.bearer.mId
  const email = req.bearer.email
  const message = req.body.message

  let output={success:false, message:'發送訊息失敗'}

  let sql = `INSERT INTO csmessage(fromWho, toWho, messsage) VALUES ('${email}','csStaff','${message}')`

  const [rows] = await db.query(sql)
  console.log(rows)

  if(rows.length < 1){
    res.status(200).json(output)
  } else{
    output.success=true
    output.message='成功發送對話'
    res.status(200).json(output)
  }
})

// 線上客服 用戶端:　讀取全部對話
router.get('/getAllMessage',async (req, res, next) => {
  // console.log(req.bearer)
  const mId = req.bearer.mId
  const email = req.bearer.email

  let sql = `SELECT * FROM csmessage WHERE fromWho = '${email}' OR toWho ='${email}'`

  const [rows] = await db.query(sql)
  console.log(rows)
  res.status(200).json(rows)
})



// 線上客服 客服端:　發送訊息
router.post('/staffSendMessage',async (req, res, next) => {
  console.log(req.body)
  const id = 'csStaff'
  const id2 = req.body.mId
  const message = req.body.message

  let output={success:false, message:'發送訊息失敗'}

  let sql = `INSERT INTO csmessage(fromWho, toWho, messsage) VALUES ('${id}','${id2}','${message}')`

  const [rows] = await db.query(sql)
  console.log(rows)

  if(rows.length < 1){
    res.status(200).json(output)
  } else{
    output.success=true
    output.message='成功發送對話'
    res.status(200).json(output)
  }
})

// 線上客服 客服端:　讀取全部對話
router.get('/getThisMemberMessage/:email',async (req, res, next) => {
  // console.log(req.params.email)
  const email = req.params.email

  let sql = `SELECT * FROM csmessage WHERE fromWho = '${email}' OR toWho ='${email}'`

  const [rows] = await db.query(sql)
  console.log(rows)
  res.status(200).json(rows)
})

// 線上客服 客服端:　側邊會員清單
router.get('/staffGetList',async (req, res, next) => {

  let sql = `SELECT DISTINCT fromWho,MAX (created_at)
  FROM csmessage
  GROUP BY fromWho
  ORDER BY created_at DESC, fromWho `

  const [rows] = await db.query(sql)
  console.log(rows)
  res.status(200).json(rows)
})

// 線上客服 客服端: 讀取會員個人資料
router.get('/staffGetMemberdata/:email', async(req, res, next) => {
  let email= req.params.email
  let sql = `SELECT * FROM Member WHERE email = '${email}'`
  const [rows] = await db.query(sql)
  console.log('123',rows)
  let result = {}
  if (rows.length) result = rows[0]
  res.status(200).json(result)

})
// 線上客服 客服端: 讀取會員個人資料
router.get('/getAmountOfConsumption', async (req, res, next) => {
  console.log(req.bearer.mId)
  let mId = req.bearer.mId

  let sql = `SELECT mId ,SUM(cartTotal) AS money FROM cartorder WHERE mId= '${mId}' GROUP BY mId `

  const [rows] = await db.query(sql)
  console.log(rows)
  res.status(200).json(rows)
})


// 測試用
router.get("/try-sess", (req, res) => {
  // req.session.my_var = req.session.my_var || 0; //預設為0
  // req.session.my_var++;
  res.json({
    // my_var: req.session.my_var,
    session: req.session.member,
  });
});

router.get("/", async (req, res) => {
  res.json(Member.getTest(req.url));
});

module.exports = router;
