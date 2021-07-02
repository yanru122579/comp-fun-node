const db = require(__dirname + "/../modules/mysql-connect");
const moment = require("moment-timezone");
//CRUD
class Cart {
  constructor(data) {
    let defaultData = {
      cartOrderId: moment().format("YYMMDDhhmmss"),
      mid: "1",
      cartStatus: "456",
      cartDescription: "1",
      cartLogisticsId: "1",
      cartPayId: "1",
      cartTotal: "1",
      nNN: "",
      nAA: "",
      nCC: "",
      nEE: "",
      orderclass: "3",
    };

    this.data = { ...defaultData, ...data };
  }
  //CRUD
  getRows() {}

  //儲存:新增 或 修改
  async save() {
    //如果 sid 為null 表示是新建的物件
    if (!this.data.sid) {
      let sql = "INSERT INTO `cartorder` SET ?";
      let [result] = await db.query(sql, [this.data]);
      if (result.insertId) {
        this.data.sid = result.insertId;
        return this.data;
      } else {
        return false; //新增失敗
      }
    } else {
      //如果sid已經有值,就做更新
      const o = { ...this.data };
      delete o.cartOrderId;

      let sql = "UPDATE `cartorder` SET ? WHERE `cartOrderId`";
      let [result] = await db.query(sql, [o, this.data.sid]);
      if (result.changedRows) {
        return this.data;
      } else {
        return false;
      }
    }
  }
  static async getRows(params = {}) {
    let perPage = params.perPage || 5; //每頁有幾筆
    let page = params.page || 1; //查看第幾頁
    let cate = parseInt(params.cate) || 0; //分類編號
    let keyword = params.keyword || ""; //搜尋產品名稱或者作者姓名
    let orderBy = params.orderBy || ""; //排序

    let where = " WHERE 1 ";

    if (cate) {
      where += " AND orderclass=" + cate;
    }
    if (keyword) {
      let k2 = db.escape("%" + keyword + "%");
      where += ` AND (nNN LIKE ${k2} OR nAA LIKE ${k2})`;
    }

    let orderStr = "";
    switch (orderBy) {
      case "price":
      case "price-asc":
        orderStr = " ORDER BY `cartTotal` ASC ";
        break;
      case "price-desc":
        orderStr = " ORDER BY `cartTotal` DESC ";
        break;
      case "pages":
      case "pages-asc":
        orderStr = " ORDER BY `pages` ASC ";
        break;
      case "pages-desc":
        orderStr = " ORDER BY `pages` DESC ";
        break;
    }

    let t_sql = `SELECT COUNT(1) num FROM cartorder ${where}`;
    let [r1] = await db.query(t_sql);
    let total = r1[0]["num"];

    let r2,
      totalPages = 0;
    if (total) {
      totalPages = Math.ceil(total / perPage);
      let r_sql = `SELECT * FROM cartorder ${where} ${orderStr} LIMIT ${
        (page - 1) * perPage
      }, ${perPage}`;
      [r2] = await db.query(r_sql);
    }

    return {
      total,
      perPage,
      page,
      data: r2,
    };
  }

  static async getItems(params = {}) {
    let results = await Product.getRows(params);

    if (results.data && results.data.length) {
      results.data = results.data.map((el) => new Card(el));
    }
    return results;
  }

  //讀取單筆
  static async getRow(sid) {
    if (!sid) return null;
    let sql = "SELECT * FROM `cartorder` WHERE `cartOrderId` = ?";
    let [r] = await db.query(sql, [sid]);
    if (!r || r.length) {
      return null;
    }
    // console.log([r]);
    return r[0];
  }

  static async getItem(sid) {
    let row = await Cart.getRow(sid);
    // console.log(row);
    return new Cart(row);
  }

  //刪除資料
  //   async remove() {
  //     if (!this.data.sid) return false;
  //     let sql = "DELETE FROM `cartorder` WHERE `cartOrderId`=?";
  //     let [r] = await db.query(sql, [this.data.sid]);
  //     if (r.affectedRows) {
  //       this.data.sid = null;
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  // }
  async remove() {
    if (!this.data.sid) return false;
    let sql = "DELETE FROM `cartorder` WHERE `cartOrderId`=?";
    let [r] = await db.query(sql, [this.data.sid]);
    if (r.affectedRows) {
      this.data.sid = null;
      return true;
    } else {
      return false;
    }
  }
}

module.exports = Cart;
