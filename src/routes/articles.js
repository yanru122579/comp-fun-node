//情報誌api路由
const express = require("express");

const Articles = require(__dirname + "/../models/Articles");

const router = express.Router();


//路由請由此開始設定
//範例:
router.get("/", async (req, res) => {
  res.json(Articles.getTest(req.url));
});

module.exports = router;
