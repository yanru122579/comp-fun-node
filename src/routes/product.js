//產品api路由
// 這個確定要留 by弘裕
const express = require("express");

const Product = require(__dirname + "/../models/Product");

const router = express.Router();

/*
列表 + 篩選 (包含關鍵字搜尋）

單項商品

 */

//取得單筆商品完整資料
router.get("/item/:pid", async (req, res) => {
  let p = await Product.getItemById(req.params.pid);
  res.json(p);
});

// 取得標記該tag的商品
router.get("/tag/:ptag", async (req, res) => {
  let p = await Product.getByTag(req.params.ptag);
  res.json(p);
});

// 取得多組TAG商品(每組2個)/product/tags/1/2/3/4/5/6/
router.get("/tags/*", async (req, res) => {
  const paramsArray = req.params[0].split('/');
  // console.log(paramsArray)
  let p = await Product.getByTags(paramsArray);
  res.json(p);
});

// 取得最多5個tag
// router.get("/tags/*", async (req, res) => {
//   const paramsArray = req.params[0].split('/');
//   paramsArray.map((value)=>{
//     let p = await Product.getByTags(value);
//   })
//   res.json(p);
// });

// 取得類別所有項目
router.get("/cat/:catid", async (req, res) => {
  let p = await Product.getByCat(req.params.catid);
  res.json(p);
});

// 取得雙類別卡片項目(a+b)
router.get("/catone/:catidone/:catidtwo?", async (req, res) => {
  let p = await Product.getByCatCard(req.params.catidone,req.params.catidtwo);
  res.json(p);
});

// 取得最新項目
router.get("/latest", async (req, res) => {
  let p = await Product.getLatest();
  res.json(p);
});



// 取得所有商品 + 篩選 ?
// router.get("/", async (req, res) => {
//   res.json([req.baseUrl, req.url]);
// });

// 新增商品測試
// router.get("/add", async (req, res) => {
//   const p1 = new Product({
//     author: "abc",
//     bookname: "XX大全",
//   });
//   const obj1 = await p1.save();

//   const p2 = await Product.getItem(23);
//   p2.data.author = "林小新2";
//   const obj2 = await p2.save();

//   const p3 = await Product.getItem(25);
//   res.json([req.baseUrl, req.url, obj1, obj2, await p3.remove()]);
// });

// 取得單項商品
// router.get("/all", async (req, res) => {
//   res.json(await Product.getRows({ id: "12" }));
//   //   res.json(await Product.getItem(12));
// });


// 取得單項商品
// router.get("/:sid", async (req, res) => {
//   let p = await Product.getRow(req.params.sid);
//   res.json([req.baseUrl, req.url, p]);
// });

module.exports = router;
