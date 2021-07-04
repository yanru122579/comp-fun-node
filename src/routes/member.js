//會員api路由
const express = require("express");

const Member = require(__dirname + "/../models/Member");

const router = express.Router();

//路由請由此開始設定
//範例:
router.get("/", async (req, res) => {
  res.json(Member.getTest(req.url));
});

module.exports = router;
