//情報誌api路由
const { json } = require("express");
const express = require("express");
const Articles = require(__dirname + "/../models/Articles");
const router = express.Router();
const upload = require(__dirname + "/../modules/upload-img")
const db = require(__dirname + "/../modules/mysql2-connect");
//路由請由此開始設定

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

// 取得類別5篇
router.get('/cate/top/:aCategoryId', async(req, res)=>{
  let p = await Articles.getCateTop(req.params.aCategoryId)    
  res.json(p);
});

// 取得分類名稱
router.get('/cate/name/:aCategoryId', async(req, res)=>{
  let p = await Articles.getCateName(req.params.aCategoryId)    
  res.json(p);
});

// 取得標籤名稱
router.get('/tag/name/:tagId', async(req, res)=>{
  let p = await Articles.getTagName(req.params.tagId)    
  res.json(p);
});

// 取得單篇文章所帶多個標籤
router.get('/a/tag/:aId', async(req, res)=>{
  let p = await Articles.getArticleTag(req.params.aId)
  res.json(p);
})

// 取得單一標籤所帶文章
router.get('/tags/:tagId', async(req, res)=>{
  let p = await Articles.getTagFilterArticles(req.params.tagId)
  res.json(p);
})

// 取得單篇文章
router.get('/a/:aId', async(req, res)=>{
  let p = await Articles.getPost(req.params.aId)    
  res.json(p);
});

// 取得首頁最新標籤
router.get('/tag', async(req, res)=>{
  console.log('tag')
  let p = await Articles.getTag(req)
  res.json(p)
})

// 取得全部
router.get('/allpost', async(req, res)=>{
  res.json(await Articles.getRows());
});

// 新增會員留言
router.post('/comment/add', upload.none(), async(req, res)=>{ 
  console.log('body',req.body)
  const c = new Articles({    
    name: req.body.name,
    content: req.body.comment,
    mId: req.body.mId,
    aId: req.body.aId,
  });
  
  const newCid = await c.add();
  res.json([req.baseUrl, req.url, newCid]);
});

// 取得會員留言
router.get('/comment/:aId', async(req, res)=>{
  console.log(req.params)
  let aId = req.params.aId
  let p = await Articles.getComment(aId)
  res.json(p)
})

// 新增商家回覆
router.post("/comment/:cId", upload.none(), async (req, res) => {
  const data = {
    ...req.body,
  };

  let ouput = {
    success: false,
    type: "danger",
    error: "",
    results: {},
  };
  const sql = "UPDATE acommentlist SET ? WHERE cId=?";
  console.log(req.body);
  const [results] = await db.query(sql, [
    { reply: req.body.reply
    },
    req.params.cId,
  ]);

  output = results;
  res.json(output);
});

module.exports = router;
