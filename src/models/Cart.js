const db = require(__dirname + "/../modules/mysql2-connect");
const cartName = "cart1";
//購物車SQL
//取得購物車的內容
//[{sid:1,quantity:2},{sid:1,quantity:3}]
class Cart {
  //取得購物車的名為cart1的cartName session資料
  static getContents(session) {
    session[cartName] = session[cartName] || [];
    return session[cartName];
  }

  //加入商品
  static async add(session, itemSid, quantity = 1) {
    session[cartName] = session[cartName] || [];
    const output = {
      success: false,
      cart: [],
    };
    //購物車的內容
    //[{sid:1,quantity:2},{sid:1,quantity:3}]
    let cart = session[cartName];

    //檢查購物車裡是否有這項商品
    let results = cart.filter((el) => +itemSid === el.sid);
    if (!results.length) {
      //如果沒有在購物車裡面
      //TODO:檢查有沒有這項商品
      let sql =
        "SELECT `sid`, `author`, `bookname`, `category_sid`, `book_id`, `publish_date`, `pages`, `price` FROM products WHERE sid=?";
      let [rs] = await db.query(sql, [itemSid]);
      if (rs && rs.length) {
        //push物件
        cart.push({
          ...rs[0],
          quantity,
        });
        output.success = true;
      }
    }
    output.cart = Cart.getContents(session);

    return output;
  }

  //變更商品數量
  static async update(session, itemSid, quantity = 1) {
    session[cartName] = session[cartName] || [];
    const output = {
      success: false,
      cart: [],
    };
    //購物車的內容
    //[{sid:1,quantity:2},{sid:1,quantity:3}]
    let cart = session[cartName];
    //如果有的話 他會是一個arr
    let results = cart.filter((el) => +itemSid === el.sid);
    if (results.length) {
      results[0].quantity = quantity;
      output.success = true;
      output.cart = Cart.getContents(session);
      return output;
    } else {
      //如果沒有該商品 就加入
      return await Cart.add(session, itemSid, quantity);
    }
  }
  //移除項目商品
  static remove(session, itemSid) {
    session[cartName] = session[cartName] || [];
    const output = {
      success: false,
      cart: [],
    };
    //購物車的內容
    //[{sid:1,quantity:2},{sid:1,quantity:3}]
    let cart = session[cartName];
    let oriLength = cart.length;
    //如果有的話 他會是一個arr
    session[cartName] = cart.filter((el) => +itemSid !== el.sid);
    if (session[cartName].length !== oriLength) {
      output.success = true;
    }
    output.cart = Cart.getContents(session);
    return output;
  }
  //清空購物車
  static clear(session) {
    session[cartName] = [];
    const output = {
      success: true,
      cart: [],
    };

    return output;
  }
}

module.exports = Cart;
