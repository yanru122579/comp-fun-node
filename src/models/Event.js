const db = require(__dirname + "/../modules/mysql2-connect");

// 找活動SQL

// CRUD
//範例以下除了class本體名稱以外都可刪除
class Event {
   constructor(data) {
    // data: Object
    let defaultData = {
      sid: null,
    };
    this.data = { ...defaultData, ...data };
  }
    static getTest() {
      const r = {testkey:'這是eventapi'}
      console.log(r);
      return r;
    }

}

module.exports = Event;
