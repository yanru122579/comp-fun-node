//找場地api路由
const express = require("express");

const Pickplace = require(__dirname + "/../models/Pickplace");

const router = express.Router();

//路由請由此開始設定
//範例:
router.get("/", async (req, res) => {
  res.json(Pickplace.getTest(req.url));
});


module.exports = router;
