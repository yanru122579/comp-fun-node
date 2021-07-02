const mysql = require("mysql2");

const pool = mysql.createPool({
  host: "localhost",
  user: "dblink",
  password: "campfun2021",
  database: "campfun",
  waitForConnections: true,
  connectionLimit: 100, // 最大連線數
  queueLimit: 0,
});

module.exports = pool.promise();
