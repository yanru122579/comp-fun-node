//活動api路由
const express = require("express");

const Event = require(__dirname + "/../models/Event");

const router = express.Router();

//路由請由此開始設定
//範例:
router.get("/", async (req, res) => {
  res.json(Event.getTest(req.url));
});

module.exports = router;
