const express = require("express");
const moment = require("moment-timezone");

const Cart = require(__dirname + "/../models/Cart");

const router = express.Router();

// 取得所有商品 + 篩選 ?
router.get("/", async (req, res) => {
  res.json([req.baseUrl, req.url]);
});
//新增商品測試
router.get("/add", async (req, res) => {
  const p1 = new Cart({
    // cartOrderId: moment().format("YYMMDDhhmmss"),
    nNN: "abc",
    nAA: "台中",
    nCC: "0918888888",
    nEE: "abc@",
  });
  const obj1 = await p1.save();

  const p2 = await Cart.getItem(15615615);
  p2.data.nNN = "王心心3";
  const obj2 = await p2.save();

  const p3 = await Cart.getItem(210630022755);
  res.json([req.baseUrl, req.url, obj1, obj2, await p3.remove()]);
});
// 取得單項商品
router.get("/all", async (req, res) => {
  res.json(await Cart.getRows({ orderBy: "price-desc" }));
});

// 取得單項商品
router.get("/:sid", async (req, res) => {
  res.json([req.baseUrl, req.url]);
});

module.exports = router;
