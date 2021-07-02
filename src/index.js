require("dotenv").config();
const port = process.env.PORT || 4000;
const express = require("express");
const session = require("express-session");
const MysqlStore = require("express-mysql-session")(session);
const db = require(__dirname + "/modules/mysql-connect");
const sessionStore = new MysqlStore({}, db);
const cors = require("cors");

const upload = require(__dirname + "/modules/upload-img");

const fs = require("fs");

const app = express();

// cors 白名單
app.use(cors());
const whitelist = ["http://localhost:3000", undefined];
const corsOptions = {
  credentials: true,
  origin: function (origin, callback) {
    console.log("origin:" + origin);
    if (whitelist.indexOf(origin) !== -1) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS"));
    }
  },
};

app.use(
  session({
    saveUninitialized: false,
    resave: false,
    secret: "kre94865790lkglkdjflkdfghlsrhddk",
    store: sessionStore,
    cookie: {
      maxAge: 1200000,
    },
  })
);

app.use(cors(corsOptions));
app.use(express.urlencoded({ extended: false })); // middleware // 中介軟體
app.use(express.json());
// app.use(express.static('public'));
app.use(express.static(__dirname + "/../public"));


//yanru---
app.use("/cart", require(__dirname + "/routes/cart-order"));
//test
app.use("/cart2", require(__dirname + "/routes/cart2"));
//products
app.use("/products", require(__dirname + "/routes/products"));
app.use("/cart", require(__dirname + "/routes/cart"));


//商品
app.use("/product", require(__dirname + "/routes/product"));

//情報誌
app.use("/aticles", require(__dirname + "/routes/aticles"));

//會員
app.use("/member", require(__dirname + "/routes/member"));

//場地
app.use("/pickplace", require(__dirname + "/routes/pickplace"));

//活動
// app.use("/", require(__dirname + "/routes/"));


// 404 放在所有的路由後面
app.use((req, res) => {
  res.type("text/html");
  res.status(404).send("<h1>找不到頁面</h1>");
});
// 路由定義：結束

app.listen(port, () => {
  console.log(`server started: ${port}`);
});
