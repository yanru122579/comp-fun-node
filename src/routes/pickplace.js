//找場地api路由
const express = require("express");

const Pickplace = require(__dirname + "/../models/Pickplace");

const router = express.Router();



//路由請由此開始設定



// 取得全部場地
router.get("/all", async (req, res) => {
  res.json(await Pickplace.getRows());
});

// 取得篩選地區後場地
router.post("/catchdata", async (req, res) => {
  res.json(await Pickplace.getRows({keyword:`${req.body.cLocation}`}));
});


// 取得單筆場地
router.post("/catchone", async (req, res) => {
  res.json(await Pickplace.getItem(req.body.i));
});




module.exports = router;
