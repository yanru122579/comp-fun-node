const db = require(__dirname + "/../modules/mysql2-connect");
// 找場地 SQL



class Pickplace { 
  constructor(data) {
    let defaultData = {
    placeId: null,
    placeName: '',
    placeLoc: '',
    placeDesc: '',
    placeRating: 0,
    placeViewImg: '',
    areaId: null,
    placeSImg: '',
    placeAImg: '',
    placeArea: '',
    placeType: '',
    placeSize: '',
    tentQty: 0,
    weekdaysPrice: 0,
    holidayPrice: 0,
    continuousPrice: 0,
    altitude: '',
    feature:'',
    bathroom:'',
    wlComm:'',
    pet:'',
    equipment:'',
    service:'',
    parking:'',
  };

  this.data = { ...defaultData, ...data };
}


static async getRows(params = {}) {
  let perPage = params.perPage || 8; // 每頁有幾筆
  let page = params.page || 1; // 查看第幾頁
  let cate = parseInt(params.cate) || 0; // 分類編號
  let keyword = params.keyword || ""; // 搜尋篩選
  let orderBy = params.orderBy || ""; // 排序

  let where = " WHERE 1 ";
  if (cate) {
    where += " AND category_sid=" + cate;
  }
  if (keyword) {
    let k2 = db.escape("%" + keyword + "%");
    where += ` AND (placeLoc LIKE ${k2})`;
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

  // `SELECT COUNT(1) num FROM \`placeinfo\` ${where}`; 獲得總筆數

  let t_sql = `SELECT COUNT(1) num FROM \`placeinfo\` ${where}`; //獲得總筆數

  // SELECT COUNT(1) num FROM `placeinfo` INNER JOIN `placeprice` ON `placeinfo`.`placeId` = `placeprice`.`placeId` INNER JOIN `placeinfodesc` ON `placeinfodesc`.`placeDescId` = `placeinfo`.`placeId` WHERE 1

  let [r1] = await db.query(t_sql);
  let total = r1[0]["num"];

  let r2,
    totalPages = 0;
  if (total) {
    totalPages = Math.ceil(total / perPage);  //總共資料筆數除每頁要幾筆=總頁數
    let r_sql = `SELECT * FROM \`placeinfo\` ${where} ${orderStr} LIMIT ${
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



 static async getRow(placeId) {
  if (!placeId) return null;

  let sql =" SELECT * FROM `placeinfo` INNER JOIN `placeprice` ON `placeinfo`.`placeId` = `placeprice`.`placeId` INNER JOIN `placeinfodesc` ON `placeinfodesc`.`placeDescId` = `placeinfo`.`placeId` WHERE `placeinfo`.`placeId` = ?"

  let [r] = await db.query(sql, [placeId]);


  // let t_sql = "SELECT COUNT(1) num FROM `placeinfo` INNER JOIN `placeprice` ON `placeinfo`.`placeId` = `placeprice`.`placeId` WHERE `placeinfo`.`placeId` = ?" 
  // let [r1] = await db.query(t_sql);
  // let areatotal = r1[0]["num"];


  // if (!r || r.length) {
  //   return null;
  // }
  // console.log(r[0]);
  return {data: r};
}

//讀取單筆
static async getItem(placeId) {
  let row = await Pickplace.getRow(placeId);
  return row;
}




}

module.exports = Pickplace
