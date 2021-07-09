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

// 取得類別
router.get('/cate/:aCategoryId', async(req, res)=>{
  let p = await Articles.getCate(req.params.aCategoryId)    
  res.json(p);
});

// 取得類別名
router.get('/cate/top/:aCategoryId', async(req, res)=>{
  let p = await Articles.getCateTop(req.params.aCategoryId)    
  res.json(p);
});


// 取得單篇文章所帶多個標籤
router.get('/a/tag/:aId', async(req, res)=>{
  let p = await Articles.getArticleTag(req.params.aId)
  res.json(p);
})

// 取得單一標籤所帶文章
router.get('/tag/:tagId', async(req, res)=>{
  let p = await Articles.getTagFilterArticles(req.params.tagId)
  res.json(p);
})


// 取得單篇文章
router.get('/a/:aId', async(req, res)=>{
  let p = await Articles.getRow(req.params.aId)    
  res.json(p);
});


// 取得首頁最新標籤
router.get('/tag', async(req, res)=>{
  console.log('tag')
  let p = await Articles.getTag(req)
  res.json(p)
})


// 取得全部
router.get('/', async(req, res)=>{
  res.json(await Articles.getRows());
}); 


module.exports = router;
