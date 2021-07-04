//情報誌api路由
const express = require("express");

const Articles = require(__dirname + "/../models/Articles");

const router = express.Router();


//路由請由此開始設定
//範例:
// router.get("/", async (req, res) => {
//   res.json(Articles.getTest(req.url));
// });

// 取得全部
router.get('/', async(req, res)=>{
  res.json(await Articles.getRows());
});


// 取得單項
router.get('/:aId', async(req, res)=>{
  let p = await Articles.getRow(req.params.aId)    
  res.json([req.baseUrl, req.url, p]);
});


// 取得類別 ( need to update )
// router.get('/cate2', async(req, res)=>{
//   res.json(await Articles.getRows({cate:2}));
// });
// router.get('/cate3', async(req, res)=>{
//   res.json(await Articles.getRows({cate:3}));
// });
// router.get('/cate4', async(req, res)=>{
//   res.json(await Articles.getRows({cate:4}));
// });
// router.get('/cate5', async(req, res)=>{
//   res.json(await Articles.getRows({cate:5}));
// });


// 類別名稱

module.exports = router;
