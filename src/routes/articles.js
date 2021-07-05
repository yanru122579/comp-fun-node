//情報誌api路由
const express = require("express");

const Articles = require(__dirname + "/../models/Articles");

const router = express.Router();


//路由請由此開始設定
//範例:
// router.get("/", async (req, res) => {
//   res.json(Articles.getTest(req.url));
// });


// 取得最新
router.get('/latest', async(req, res)=>{
  console.log('latest')
  let p = await Articles.getLatest(req)
  res.json(p)
})

// 取得標籤
router.get('/tag', async(req, res)=>{
  console.log('tag')
  let p = await Articles.getTag(req)
  res.json(p)
})

// 取得單項
router.get('/a/:aId', async(req, res)=>{
  let p = await Articles.getRow(req.params.aId)    
  res.json(p);
});


// 取得類別
router.get('/cate/:aCategoryId', async(req, res)=>{
  let p = await Articles.getCate(req.params.aCategoryId)    
  res.json(p);
});

// old one
// router.get('/cate/:aCategoryId', async(req, res)=>{
//   res.json(await Articles.getRows(req.params.aCategoryId));
// });


// 取得全部
router.get('/', async(req, res)=>{
  res.json(await Articles.getRows());
});


module.exports = router;
