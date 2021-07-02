require("dotenv").config();
const port = process.env.PORT || 6005;
const express = require("express");
const session = require("express-session");
const MysqlStore = require("express-mysql-session")(session);
const db = require(__dirname + "/modules/mysql-connect");
const sessionStore = new MysqlStore({}, db);
const cors = require("cors");
//以下三 爬蟲測試用
const request = require("request");
const cheerio = require("cheerio");
const async = require("async");

const upload = require(__dirname + "/modules/upload-img");

const fs = require("fs");

const app = express();
app.set("view engine", "ejs");

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
//以下爬蟲用

// getCities((cities) => {
//   async.map(
//     cities,
//     (city, callback) => {
//       getStories(city, (stores) => {
//         callback(null, stores);
//       });
//     },
//     (err, results) => {
//       console.log([].concat.apply([], results));
//     }
//   );
// });

// function getCities(callback) {
//   request(
//     "http://www.ibon.com.tw/retail_inquiry.aspx#gsc.tab=0",
//     (err, res, body) => {
//       var $ = cheerio.load(body);
//       var cities = $("#Class1 option")
//         .map((index, obj) => {
//           return $(obj).text();
//         })
//         .get();
//       callback(cities);
//     }
//   );
// }

// function getStories(city, callback) {
//   var options = {
//     url: "http://www.ibon.com.tw/retail_inquiry_ajax.aspx",
//     method: "POST",
//     form: {
//       strTargetField: "COUNTY",
//       strKeyWords: city,
//     },
//   };
//   request(options, (err, res, body) => {
//     var $ = cheerio.load(body);
//     var stores = $("tr")
//       .map((index, obj) => {
//         return {
//           id: $(obj).find("td").eq(0).text().trim(),
//           store: $(obj).find("td").eq(1).text().trim(),
//           address: $(obj).find("td").eq(2).text().trim(),
//         };
//       })
//       .get();
//     stores.shift();
//     callback(stores);
//   });
// }

// 404 放在所有的路由後面
app.use((req, res) => {
  res.type("text/html");
  res.status(404).send("<h1>找不到頁面</h1>");
});
// 路由定義：結束

app.listen(port, () => {
  console.log(`server started: ${port}`);
});
