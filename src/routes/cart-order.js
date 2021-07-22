//購物車session路由 & 部分SQL
const express = require("express");
const moment = require("moment-timezone");
const db = require(__dirname + "/../modules/mysql2-connect");
const upload = require(__dirname + "/../modules/upload-img");

const router = express.Router();

//訂單列表
const totalorder = `SELECT cartOrder.cartOrderId,cartOrder.created_at,member.fName,cartOrder.nNN,cartOrder.nAA,cartOrder.nCC,cartOrder.cartStatus,cartLogistics.cartLogisticsName,carPay.cartPayName,cartOrder.cartTotal,cartOrder.cartDescription FROM cartOrder INNER JOIN member ON cartOrder.mid = member.mId INNER JOIN carPay ON cartOrder.cartPayId = carPay.cartPayId INNER JOIN cartLogistics ON cartOrder.cartLogisticsId = cartLogistics.cartLogisticsId`;

//給訂單使用,查詢訂單頁面
const getListData = async (req) => {
  let output = {
    success: false,
    error: "",
    totalRows: 0,
    totalPages: 0,
    page: 0,
    rows: [],
  };
  //設定條件篩選 我拿來篩類別的 後面會用到可以先把要篩的都放這裡
  const orderClass = req.query.orderClass;
  const category = ` AND cartorder.orderclass = '${+orderClass}'`;
  //設定交易狀態
  const cartStatus = req.query.cartStatus;
  const cartStatus1 = ` AND cartorder.cartStatus= '${cartStatus}'`;
  //設定會員
  const mid = req.query.mid;
  const mid1 = ` AND cartorder.mid= '${mid}'`;
  //設定頁數
  let page = req.query.page || 1;
  //將數字轉成整數
  page = parseInt(page);
  //搜尋總表  看總筆數
  let t_sql = "SELECT COUNT(1) num FROM cartorder WHERE 1";
  //將上面的篩選類別拿下來使用 如果我的網址有類別 就總筆數where類別
  orderClass ? (t_sql += category) : t_sql;
  cartStatus ? (t_sql += cartStatus1) : t_sql;
  mid ? (t_sql += mid1) : t_sql;
  //去資料庫找總表的總筆數
  let [r1] = await db.query(t_sql);
  const perPage = 5; // 每頁要呈現幾筆資料
  const totalRows = r1[0].num; // 資料表的總筆數
  const totalPages = Math.ceil(totalRows / perPage); // 總共有幾頁
  let rows = []; // 某分頁的資料預設為空的
  if (totalRows > 0) {
    if (page < 1) {
      output.error = "page 值太小";
      return output;
    }
    if (page > totalPages) {
      output.error = "page 值太大";
      return output;
    }
    //上面篩類別與總筆數頁數的設定  下面搜所有物品
    //也是搜尋總表 但因為我要搭配購買商品 所以我join商品
    let sql = `SELECT cartOrder.cartOrderId,cartOrder.created_at,member.fName,cartOrder.nNN,cartOrder.startTime,cartOrder.endTime,cartOrder.countries,cartOrder.mid,cartOrder.townships,cartOrder.nAA,cartOrder.nCC,cartOrder.cartStatus,cartLogistics.cartLogisticsName,cartorder.gameDay,cartorder.newMember,carPay.cartPayName,cartOrder.cartTotal,cartOrder.cartDescription,cartorder.orderclass FROM cartOrder INNER JOIN member ON cartOrder.mid = member.mId INNER JOIN carPay ON cartOrder.cartPayId = carPay.cartPayId INNER JOIN cartLogistics ON cartOrder.cartLogisticsId = cartLogistics.cartLogisticsId`;
    //定義排序 用時間 最新到最舊 與設定頁數
    const limit = ` ORDER BY cartOrder.created_at DESC LIMIT ${
      (page - 1) * perPage
    }, ${perPage}`;
    //如果網址上有類別 就將sql+上where 去篩類別
    orderClass ? (sql += category) : sql;
    cartStatus ? (sql += cartStatus1) : sql;
    mid ? (sql += mid1) : sql;
    //sql 再加上排序與頁數的變數
    sql += limit;
    //將sql去資料庫做搜尋 丟回[row]
    [rows] = await db.query(sql);
    //以下是將時間做格式化處理
    rows.forEach((el) => {
      el.created_at = moment(el.created_at).format("YYYY-MM-DD");
    });
  }
  //如果上面沒錯誤 就將 頁數 總筆數 搜尋總表放到output裏面
  if (!output.error) {
    output = {
      success: true,
      error: null,
      totalRows,
      totalPages,
      page,
      rows,
    };
  }
  //回傳 output
  return output;
};

//這個api與上面的收尋做搭配 只要輸入http://localhost:4000/自己的路由/api  =會出現所有
//http://localhost:4000/cartorder/api?/page=2   =會出現第二頁
//http://localhost:4000/cartorder/api?/page=2&orderClass=3   =會出現第二頁且類別為３的東西
//取得訂單API 訂單查詢頁面
router.get("/api", async (req, res) => {
  res.json(await getListData(req));
});

//取得訂單商品詳細 訂單查詢頁面
// router.get("/item", async (req, res) => {
//   let t_sql =
//     "SELECT cartorder.cartorderId,cartitem.cartName,cartitem.cartName,cartitem.cartBuyQty,cartitem.cartBuyP FROM cartorder INNER JOIN cartitem ON cartorder.cartOrderId = cartitem.cartorderid WHERE cartorder.cartOrderId = 20210513175124";
//   let [r1] = await db.query(t_sql);
//   res.json(r1);
// });
//查詢各項訂單的細節頁面
router.get("/item/:cartOrderId", async (req, res) => {
  let r = [];
  let ordersql = `SELECT * FROM \`cartorder\``;
  let orderwhere = ` WHERE cartOrderId = ?`;
  ordersql += orderwhere;
  let [r1] = await db.query(ordersql, [req.params.cartOrderId]);
  let [r2] = r1;
  console.log(r2.orderclass);
  //商品詳細頁
  if (r2.orderclass == 0) {
    let item1 =
      "SELECT * FROM cartorder INNER JOIN cartitem ON cartorder.cartOrderId = cartitem.cartOrderId WHERE cartorder.cartorderid = ?";
    let [item2] = await db.query(item1, [req.params.cartOrderId]);
    return res.json(item2);
    //活動細節頁//活動負責人還未建表後續修改
  } else if (r2.orderclass == 1) {
    let item1 =
      "SELECT * FROM cartorder INNER JOIN cartitem ON cartorder.cartOrderId = cartitem.cartOrderId WHERE cartorder.cartorderid = ?";
    let [item2] = await db.query(item1, [req.params.cartOrderId]);
    return res.json(item2);
  } else {
    //場地租借細節頁
    let item1 =
      "SELECT * FROM cartorder INNER JOIN cartplace ON cartorder.cartOrderId = cartplace.cartOrderId WHERE cartorder.cartorderid = ?";
    let [item2] = await db.query(item1, [req.params.cartOrderId]);
    return res.json(item2);
  }
});
//刪除訂單 sql=order sql1 =item sql2 =place
// router.get('/del/:cartorderid', async(req,res)=>{
//     const sql="DELETE FROM cartorder WHERE cartorderid = ?"
//     const sql1="DELETE FROM `cartitem` WHERE cartorderid =?"
//     const sql2="DELETE FROM `cartplace` WHERE cartorderid =?"
//     await db.query(sql,[req.params.cartorderid]);
//     await db.query(sql1,[req.params.cartorderid]);
//     await db.query(sql2,[req.params.cartorderid]);
//     res.json('ok')
// })
//取消訂單 將訂單狀態改為已取消 訂單查詢業專用//已完成或已發送 不能送
router.post("/edit/:cartOrderId", upload.none(), async (req, res) => {
  const data = {
    ...req.body,
    cartStatus: "已取消",
  };
  console.log(data);
  let ouput = {
    success: false,
    type: "danger",
    error: "",
    results: {},
  };
  const sql = "UPDATE `cartOrder` SET ? WHERE cartOrderId =?";
  console.log(sql);
  const [results] = await db.query(sql, [
    { cartStatus: data.cartStatus },
    req.params.cartOrderId,
  ]);
  console.log({ cartStatus: data.cartStatus });
  output = results;
  res.json(output);
});

//取得使用者加入購物車的物品 購物車頁面
router.get("/orderstart", async (req, res) => {
  let sql =
    "SELECT `productlist`.`product_id`,`productlist`.`product_name`,`productlist`.`product_img`,`productlist`.`qty`,`productlist`.`product_price`,`productcategory`.`cat_id`, `productcategory`.`cat_name` FROM `productlist` INNER JOIN `productcategory` ON `productlist`.`cat_id`=`productcategory`.`cat_id` WHERE `product_id` =  1";
  let [r1] = await db.query(sql);
  res.json(r1);
});
//結帳時將使用者資訊與商品寫入資料庫
router.post("/add", upload.none(), async (req, res) => {
  let output = {
    success: false,
    error: "",
    insertId: 0,
  };
  // 期待前端傳送過來的資料結構
  // req.body = {
  //   orderItem: [
  //   {}.
  //   {},
  // ],
  //   orderInfo: {}
  // }
  // const cartOrderId = moment().format("YYMMDDhhmmss");
  // 針對前端傳過來的item array做迴圈寫入資料庫處理
  for (let item of req.body.orderItem) {
    // item.cartOrderId = cartOrderId;
    const sql = "INSERT INTO `cartitem` SET ?";
    const [results] = await db.query(sql, [item]);
    console.log(req.body);
  }

  const sql1 = "INSERT INTO `cartorder` SET?";
  const [results1] = await db.query(sql1, [
    {
      nNN: req.body.orderInfo.nNN,
      countries: req.body.orderInfo.countries,
      townships: req.body.orderInfo.townships,
      nAA: req.body.orderInfo.nAA,
      nCC: req.body.orderInfo.nCC,
      nEE: req.body.orderInfo.nEE,
      cartPayId: req.body.orderInfo.cartPayId,
      cartLogisticsId: req.body.orderInfo.cartLogisticsId,
      mid: req.body.orderInfo.mid,
      cartTotal: req.body.orderInfo.cartTotal,
      cartDescription: req.body.orderInfo.cartDescription,
      cartStatus: req.body.orderInfo.cartStatus,
      orderclass: req.body.orderInfo.orderclass,
      cartOrderId: req.body.orderInfo.cartOrderId,
      startTime: req.body.orderInfo.startTime,
      endTime: req.body.orderInfo.endTime,
      gameDay: req.body.orderInfo.gameDay,
      newMember: req.body.orderInfo.newMember,
    },
  ]);
  output = { ...output, body: req.body.orderInfo };
  res.json(output);
});
//結帳時將使用者資訊與營地租借寫入資料庫 回圈版
router.post("/addp", upload.none(), async (req, res) => {
  let output = {
    success: false,
    error: "",
    insertId: 0,
  };

  // const cartOrderId = moment().format("YYMMDDhhmmss");
  // 針對前端傳過來的item array做迴圈寫入資料庫處理
  for (let item of req.body.orderItem) {
    // item.cartOrderId = cartOrderId;
    const sql = "INSERT INTO `cartplace` SET ?";
    const [results] = await db.query(sql, [item]);
    console.log(req.body);
  }

  const sql1 = "INSERT INTO `cartorder` SET?";
  const [results1] = await db.query(sql1, [
    {
      nNN: req.body.orderInfo.nNN,
      nAA: req.body.orderInfo.nAA,
      nCC: req.body.orderInfo.nCC,
      nEE: req.body.orderInfo.nEE,
      cartPayId: req.body.orderInfo.cartPayId,
      cartLogisticsId: req.body.orderInfo.cartLogisticsId,
      mid: req.body.orderInfo.mid,
      cartTotal: req.body.orderInfo.cartTotal,
      cartDescription: req.body.orderInfo.cartDescription,
      cartStatus: req.body.orderInfo.cartStatus,
      orderclass: req.body.orderInfo.orderclass,
      cartOrderId: req.body.orderInfo.cartOrderId,
      startTime: req.body.orderInfo.startTime,
      endTime: req.body.orderInfo.endTime,
      gameDay: req.body.orderInfo.gameDay,
      newMember: req.body.orderInfo.newMember,
    },
  ]);
  output = { ...output, body: req.body.orderInfo };
  res.json(output);
});

//線下訂單確認系統
router.get("/ordercheck/:cartOrderId/:nCC", async (req, res) => {
  let sql =
    "SELECT cartOrder.cartOrderId,cartItem.product_id,cartOrder.created_at,member.fName,cartOrder.gameDay,cartOrder.newMember,cartOrder.nNN,cartOrder.startTime,cartOrder.endTime,cartOrder.countries,cartitem.product_oimg,cartOrder.townships,cartOrder.nAA,cartOrder.nCC,cartOrder.cartStatus,cartLogistics.cartLogisticsName,carPay.cartPayName,cartOrder.cartTotal,cartOrder.cartDescription,cartitem.cartName,cartitem.cartName,cartitem.cartBuyQty,cartitem.cartBuyP FROM cartOrder INNER JOIN member ON cartOrder.mid = member.mId INNER JOIN carPay ON cartOrder.cartPayId = carPay.cartPayId INNER JOIN cartLogistics ON cartOrder.cartLogisticsId = cartLogistics.cartLogisticsId INNER JOIN cartitem ON cartorder.cartOrderId = cartitem.cartOrderId WHERE cartOrder.cartOrderId = ? AND nCC = ?";
  let [r] = await db.query(sql, [req.params.cartOrderId, req.params.nCC]);
  //如果沒有找到資料就轉向到列表頁
  if (!r.length) {
    return res.json("找不到資料");
    // return res.redirect("/cartorder/ordercheck");
  }

  res.json(r);
});
//線下確認訂單已完成或取消
router.post(
  "/ordercheck/:cartOrderId/:nCC",
  upload.none(),
  async (req, res) => {
    const data = {
      ...req.body,
    };

    let ouput = {
      success: false,
      type: "danger",
      error: "",
      results: {},
    };
    //單筆版
    const sql1 = "UPDATE `cartOrder` SET ? WHERE cartOrderId =? AND nCC = ?";
    const [results] = await db.query(sql1, [
      { cartStatus: data.cartStatus, cartTotal: data.cartTotal },
      req.params.cartOrderId,
      req.params.nCC,
    ]);

    output = results;
    res.json(output);
  }
);
//線下確認訂單已完成或取消
router.post(
  "/ordercheck1/:cartOrderId/:product_id",
  upload.none(),
  async (req, res) => {
    const data = {
      ...req.body,
    };

    let output = {
      success: false,
      type: "danger",
      error: "",
      results: {},
    };

    //迴圈版
    // for (let item of req.body.orderItem) {
    // item.cartOrderId = cartOrderId;
    // const sql =
    //   "UPDATE `cartItem` SET ? WHERE cartOrderId =? AND product_id=?";
    // console.log("1", sql);

    // const [results] = await db.query(sql, [
    //   item,
    //   req.params.cartOrderId,
    //   req.params.product_id,
    //   // req.params.nCC,
    // ]);
    const sql1 =
      "UPDATE `cartItem` SET ? WHERE cartOrderId =? AND product_id = ? ";
    const [results] = await db.query(sql1, [
      { cartBuyQty: data.cartBuyQty },
      req.params.cartOrderId,
      req.params.product_id,
    ]);
    output = results;
    res.json(output);
  }
);
// //線下確認訂單已完成或取消 保留
// router.post(
//   "/ordercheck/:cartOrderId/:nCC",
//   upload.none(),
//   async (req, res) => {
//     const data = {
//       ...req.body,
//     };

//     let ouput = {
//       success: false,
//       type: "danger",
//       error: "",
//       results: {},
//     };
//     //單筆版
//     const sql1 = "UPDATE `cartOrder` SET ? WHERE cartOrderId =? AND nCC = ?";
//     console.log(sql);
//     const [results] = await db.query(sql1, [
//       { cartStatus: data.orderInfo.cartStatus },
//       req.params.cartOrderId,
//       req.params.nCC,
//     ]);

//     //迴圈版
//     for (let item of req.body.data) {
//       // item.cartOrderId = cartOrderId;
//       const sql = "UPDATE `cartItem` SET ? WHERE cartOrderId =? ";
//       const [results] = await db.query(sql, [
//         item,
//         req.params.cartOrderId,
//         req.params.nCC,
//       ]);
//       console.log(req.body);
//     }
//     console.log(results);
//     output = results;
//     res.json(output);
//   }

// );

//用來測試member登入
router.get("/member/:mId", async (req, res) => {
  let sql =
    "SELECT * FROM member INNER JOIN coupon ON member.mId =coupon.mId WHERE member.mId=?";
  let [r1] = await db.query(sql, [req.params.mId]);
  // console.log(r1);
  res.json(r1[0]);
});

//使用庫放券
router.post("/coupon/:mId", upload.none(), async (req, res) => {
  const data = {
    ...req.body,
  };

  let ouput = {
    success: false,
    type: "danger",
    error: "",
    results: {},
  };
  const sql = "UPDATE `coupon` SET ? WHERE mId=?";
  console.log(sql);
  const [results] = await db.query(sql, [
    { newMember: req.body.newMember },
    req.params.mId,
  ]);

  output = results;
  res.json(output);
});

module.exports = router;
