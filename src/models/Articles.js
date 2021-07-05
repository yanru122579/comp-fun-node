const db = require(__dirname + "/../modules/mysql2-connect");

// 情報誌SQL

// CRUD
//範例以下除了class本體名稱以外都可刪除
class Aticles {
  constructor(data) {
    // data: Object
    let defauleData = {
      aId: null,
      aTitle: '',
      aImg: '',
      author: '',
      aContent: '',
      aCategoryId: '',
      aCommentId: '0',
      aTagId: '0',
      aDate: '1970-01-01',
      created_at: '',
      updated_at: '',
  };
  this.data = {...defauleData, ...data};
  }


    static async getRows(params={}){
        let perPage = params.perPage || 5; //每頁有幾筆
        let page = params.page || 1; // 查看第幾頁
        let cate = parseInt(params.cate) || 0; // 分類編號
        let keyword = params.keyword || ''; // 搜尋產品名稱或作者姓名
        let orderBy = params.orderBy || ''; // 排序

        let where = ' WHERE 1 ';
        if(cate) {
            where += ' AND aCategoryId='+ cate;
        } // 類別
        if(keyword){
            let k2 = db.escape('%'+ keyword+ '%');
            where += ` AND (author LIKE ${k2} OR aTitle LIKE ${k2})`
        } // 搜尋

        let orderStr = ''; // 排序
        switch(orderBy){
            case 'date-asc':
                orderStr = ' ORDER BY `aDate` ASC';
                break;
            case 'date-desc':
                orderStr = ' ORDER BY `aDate` DESC';
                break;
        }

        let t_sql = `SELECT COUNT(1) num FROM \`articlelist\` ${where}`;
        let [r1] = await db.query(t_sql);
        let total = r1[0]['num']; // 共幾筆
        
        // 如有資料再執行此totalpages
        let r2, totalPages=0;
        if(total){
            totalPages = Math.ceil(total/perPage);
            let r_sql = `SELECT * FROM \`articlelist\` ${where} ${orderStr} LIMIT ${(page-1)*perPage}, ${perPage}`;
            [r2] = await db.query(r_sql);
        }
        return {
            total,
            totalPages,
            perPage,
            page,
            params,
            data: r2,
        }
    }
    
    static async getLatest(){
        let sql="SELECT * FROM `articlelist` ORDER BY `created_at` DESC limit 3"
        let [r] = await db.query(sql);
        return r
    }

    // 讀取單筆 
    static async getRow(aId){
        if(!aId) return null;
        let sql = "SELECT * FROM `articlelist` WHERE `aId`=?"
        // 回傳取得單筆資料的陣列
        let [r] = await db.query(sql, [aId]);
        if(!r || !r.length){
            return null;
        }
        return r[0]; // then retrieve object here
    }

}

module.exports = Aticles;
