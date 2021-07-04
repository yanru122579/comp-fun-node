const db = require(__dirname + "/../modules/mysql2-connect");

// 找場地 SQL

// CRUD
//範例以下除了class本體名稱以外都可刪除
class Pickplace {   constructor(data) {
  // data: Object
  let defaultData = {
    sid: null,
  };
  this.data = { ...defaultData, ...data };
}
  static getTest() {
    const r = {testkey:'這是找場地api'}
    console.log(r);
    return r;
  }

}

module.exports = Pickplace;
