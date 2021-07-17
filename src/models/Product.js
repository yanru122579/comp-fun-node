const db = require(__dirname + "/../modules/mysql2-connect");

// 這個確定要留 by弘裕
//產品SQL
// CRUD
class Product {
  // `sid`, `author`, `bookname`, `category_sid`, `book_id`, `publish_date`, `pages`, `price`, `isbn`, `on_sale`, `introduction`
  constructor(data) {
    // data: Object
    let defaultData = {
      sid: null,
      author: "",
      bookname: "",
      category_sid: 0,
      book_id: "",
      publish_date: "1970-01-01",
      pages: 0,
      price: 0,
      isbn: "",
      on_sale: 1,
      introduction: "",
    };
    this.data = { ...defaultData, ...data };
  }


  //實際使用功能
  //關鍵字搜尋商品
  static async searchAll(key) {
    let sql = "SELECT `productlist`.`product_name`,`productlist`.`product_id`,`productlist`.`product_summary`,`productlist`.`product_ocimg` as `product_img`,`productlist`.`product_rate`,`productlist`.`product_price` FROM `productlist` WHERE `product_name` LIKE '%"+key+"%' OR `product_summary` LIKE '%"+key+"%' OR `product_desc` LIKE '%"+key+"%' AND `productlist`.`qty` > 0";
    console.log(sql)
    let [r] = await db.query(sql);
    return r;
  }


  //抓取單項商品所有TAG
  static async getTagsBypId(pid) {
    let sql = "SELECT `ataglist`.`tagName`,`ptagmap`.`tagId` FROM `ptagmap` INNER JOIN `ataglist` ON `ataglist`.`tagId`=`ptagmap`.`tagId` WHERE `pId`= ?" ;
    let [r] = await db.query(sql, [pid]);
    return r;
  }

  //抓取10筆來自AID關聯商品
  static async getByAid(aid){
    let sql = "SELECT `productlist`.`product_name`,`productlist`.`product_id`,`productlist`.`product_summary`,`productlist`.`product_ocimg` as `product_img`,`productlist`.`product_rate`,`productlist`.`product_price` FROM (`productlist` INNER JOIN `ptagmap` ON `ptagmap`.`pId` = `productlist`.`product_id`) INNER JOIN `atagmap` ON `atagmap`.`tagId`=`ptagmap`.`tagId` WHERE `atagmap`.`aId` = ? AND `productlist`.`qty` > 0 GROUP BY `ptagmap`.`pId` LIMIT 10" ;
    let[r] = await db.query(sql, [aid]);
    return r;
  }





  //抓取單項商品所有資料
  static async getItemById(pid) {
    let sql = "SELECT * FROM `productlist` WHERE `product_id`= ?" ;
    let [r] = await db.query(sql, [pid]);
    return r;
  }

  //抓取所有該tag下的商品
  static async getByTag(ptag) {
    let sql = "SELECT `productlist`.`product_name`,`productlist`.`product_id`,`productlist`.`product_summary`,`productlist`.`product_ocimg` as `product_img`,`productlist`.`product_ocimg` as `product_img2`,`productlist`.`product_rate`,`productlist`.`product_price` FROM `productlist` INNER JOIN `ptagmap` ON `ptagmap`.`pId` = `productlist`.`product_id` WHERE `ptagmap`.`tagId` = ? AND `productlist`.`qty` > 0" ;
    let [r] = await db.query(sql, [ptag]);
    return r;
  }
    //抓取多個tag下的商品
  static async getByTags(ptag) {
        console.log("ptag",ptag)
        // ptag = [...ptag]
        const data = []
        let sql = "SELECT `productlist`.`product_name`,`productlist`.`product_id`,`productlist`.`product_summary`,`productlist`.`product_ocimg` as `product_img`,`productlist`.`product_rate`,`productlist`.`product_price` FROM `productlist` INNER JOIN `ptagmap` ON `ptagmap`.`pId` = `productlist`.`product_id` WHERE `ptagmap`.`tagId` = ? AND `productlist`.`qty` > 0 LIMIT 2 " ;
        for(let el of ptag){
          let [p] = await db.query(sql,[el])
          data.push(...p)
        }
        return data
  }

  //抓取單類別所有商品
      static async getByCat(catid) {
        let sql = "SELECT `productlist`.`product_name`,`productlist`.`product_id`,`productlist`.`product_summary`,`productlist`.`product_ocimg` as `product_img`,`productlist`.`product_rate`,`productlist`.`product_price`FROM `productlist` WHERE `productlist`.`cat_id` = ? AND `productlist`.`qty` > 0 ORDER BY `productlist`.`updated_at`" ;
        let [r] = await db.query(sql,catid);
        console.log(r);
        return r;
      }

   //抓取類別所有商品(卡片用)
      static async getByCatCard(catidone,catidtwo) {
        let sql = "SELECT `productlist`.`cat_id`,`productlist`.`product_id`,`productlist`.`product_name`,`productlist`.`product_id`,`productlist`.`product_summary`,`productlist`.`product_ocimg` as `product_img`,`productlist`.`product_rate`,`productlist`.`product_price`FROM `productlist` WHERE `productlist`.`cat_id` = ? AND `productlist`.`qty` > 0 ORDER BY `productlist`.`updated_at`" ;

          let [r] = await db.query(sql,catidone)
          // console.log(r)
          if(catidtwo){
            let [r2] = await db.query(sql,catidtwo)
            // console.log (r2)
            const data=r.concat(r2)
            return data
          }else{
            return r
          }          
      }

    //抓取最新購買的商品(熱門8筆)
    static async getLatest() {
      let sql = "SELECT `productlist`.`product_name`,`productlist`.`product_id`,`productlist`.`product_summary`,`productlist`.`product_ocimg` as `product_img`,`productlist`.`product_rate`,`productlist`.`product_price`FROM `productlist` WHERE `productlist`.`qty` > 0 ORDER BY `productlist`.`updated_at` DESC LIMIT 8 " ;
      let [r] = await db.query(sql);
      console.log(r);
      return r;
    }




  // 以下範例未使用
  // 儲存：新增 或 修改
  async save() {
    // 如果 sid 為 null, 表示是新建的物件
    if (!this.data.sid) {
      let sql = "INSERT INTO `products` SET ?";
      let [result] = await db.query(sql, [this.data]);
      if (result.insertId) {
        this.data.sid = result.insertId;
        return this.data;
      } else {
        return false; // 新增失敗的情況
      }
    } else {
      // 如果 sid 已經有值，就做更新
      const o = { ...this.data };
      delete o.sid;

      let sql = "UPDATE `products` SET ? WHERE `sid`=?";
      let [result] = await db.query(sql, [o, this.data.sid]);
      if (result.changedRows) {
        return this.data;
      } else {
        return false; // 沒有修改
      }
    }
  }

  static async getRows(params = {}) {
    let perPage = params.perPage || 5; // 每頁有幾筆
    let page = params.page || 1; // 查看第幾頁
    let cate = parseInt(params.cate) || 0; // 分類編號
    let keyword = params.keyword || ""; // 搜尋產品名稱或者作者姓名
    let orderBy = params.orderBy || ""; // 排序

    let where = " WHERE 1 ";
    if (cate) {
      where += " AND category_sid=" + cate;
    }
    if (keyword) {
      let k2 = db.escape("%" + keyword + "%");
      where += ` AND (author LIKE ${k2} OR bookname LIKE ${k2}) `;
    }

    let orderStr = "";
    switch (orderBy) {
      case "price":
      case "price-asc":
        orderStr = " ORDER BY `price` ASC ";
        break;
      case "price-desc":
        orderStr = " ORDER BY `price` DESC ";
        break;
      case "pages":
      case "pages-asc":
        orderStr = " ORDER BY `pages` ASC ";
        break;
      case "pages-desc":
        orderStr = " ORDER BY `pages` DESC ";
        break;
    }

    let t_sql = `SELECT COUNT(1) num FROM \`products\` ${where}`;
    let [r1] = await db.query(t_sql);
    let total = r1[0]["num"];

    let r2,
      totalPages = 0;
    if (total) {
      totalPages = Math.ceil(total / perPage);
      let r_sql = `SELECT * FROM \`products\` ${where} ${orderStr} LIMIT ${
        (page - 1) * perPage
      }, ${perPage}`;
      [r2] = await db.query(r_sql);
    }
    return {
      total,
      totalPages,
      perPage,
      page,
      params,
      data: r2,
    };
  }

  static async getItems(params = {}) {}

  // 讀取單筆
  static async getRow(sid) {
    if (!sid) return null;
    let sql = "SELECT * FROM `products` WHERE `sid`=?";
    let [r] = await db.query(sql, [sid]);
    console.log([r]);
    if (!r || !r.length) {
      return null;
    }
    return r[0];
  }

  static async getItem(sid) {
    let row = await Product.getRow(sid);
    console.log(row);
    return new Product(row);
  }

  // 刪除
  async remove() {
    if (!this.data.sid) return false;
    let sql = "DELETE FROM `products` WHERE `sid`=?";
    let [r] = await db.query(sql, [this.data.sid]);
    if (r.affectedRows) {
      this.data.sid = null;
      return true;
    } else {
      return false;
    }
  }
}

module.exports = Product;
