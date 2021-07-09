require("dotenv").config();
const port = process.env.PORT || 4000; //api統一為port4000
const express = require("express");
const session = require("express-session");
const MysqlStore = require("express-mysql-session")(session);
const db = require(__dirname + "/modules/mysql2-connect");
const sessionStore = new MysqlStore({}, db);
const cors = require("cors");
const bcrypt =require('bcryptjs');


const upload = require(__dirname + "/modules/upload-img");

const fs = require("fs");

const app = express();

// cors 白名單
// app.use(cors());
const whitelist = ["http://localhost:3000", undefined];
const corsOptions = {
  credentials: true,
  origin: function (origin, callback) {
    console.log("origin:" + origin);
    callback(null, true);
    // if (whitelist.indexOf(origin) !== -1) {
      //   callback(null, true);
      // } else {
        //   callback(new Error("Not allowed by CORS"));
        // }git
      },
    };
    
app.use(cors(corsOptions));
app.use(
  session({
    saveUninitialized: false,
    resave: false,
    secret: "kre94865790lkglkdjflkdfghlsrhddk", //這裡暫時沒改，有用到的自行調整並且告知其他人
    store: sessionStore,
    cookie: {
      maxAge: 12000000,
    },
  })
);

app.use(express.urlencoded({ extended: false })); // middleware // 中介軟體
app.use(express.json());
app.use(express.static('public'));
// app.use(express.static(__dirname + "/../public"));

//ROUTE主要設定開始

//購物車
app.use("/cartorder", require(__dirname + "/routes/cart-order"));
app.use("/cart", require(__dirname + "/routes/cart"));

//商品
app.use("/product", require(__dirname + "/routes/product"));

//情報誌
app.use("/articles", require(__dirname + "/routes/articles"));

//會員
app.use("/member", require(__dirname + "/routes/member"));

//場地
app.use("/pickplace", require(__dirname + "/routes/pickplace"));

//活動 -預留
app.use("/event", require(__dirname + "/routes/event"));


// 404 放在所有的路由後面
app.use((req, res) => {
  res.type("text/html");
  res.status(404).send("<h1>找不到頁面</h1>");
});
// 路由定義：結束

app.listen(port, () => {
  console.log(`server started: ${port}`);
});