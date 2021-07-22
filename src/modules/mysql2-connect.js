const mysql = require("mysql2");

const pool = mysql.createPool({
  // 網路版設定:請將host更換=> 184.168.103.196
  // host: "184.168.103.196"
  host: "localhost",
  user: "dblink",
  password: "campfun2021",
  database: "campfun",
  waitForConnections: true,
  connectionLimit: 100, // 最大連線數
  queueLimit: 0,
});

module.exports = pool.promise();
