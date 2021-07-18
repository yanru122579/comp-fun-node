// 取得類別
const db = require(__dirname + "/../modules/mysql2-connect");

// 情報誌SQL

// CRUD
class Articles {

  // constructor(data) {
  //   // data: Object
  //   let defaultData = {
  //     aId: null,
  //     aTitle: '',
  //     aImg: '',
  //     author: '',
  //     aContent: '',
  //     aCategoryId: '',
  //     aCommentId: '0',
  //     aTagId: '0',
  //     aDate: '1970-01-01',
  //     created_at: '',
  //     updated_at: '',
  // };
  // this.data = {...defaultData, ...data};
  // }

  static async getRows(params={}){
      let perPage = params.perPage || 3; //每頁有幾筆
      let page = params.page || 1; // 查看第幾頁
      let cate = parseInt(params.cate) || 0; // 分類編號

      let where = ' WHERE 1 ';
      if(cate) {
          where += ' AND aCategoryId='+ cate;
      } // 類別

      let t_sql = `SELECT COUNT(1) num FROM \`articlelist\` ${where}`;
      let [r1] = await db.query(t_sql);
      let total = r1[0]['num']; // 共幾筆
        
      // 如有資料再執行此totalpages
      let r2, totalPages=0;
      if(total){
          totalPages = Math.ceil(total/perPage);
          let r_sql = `SELECT * FROM \`articlelist\` ${where} LIMIT ${(page-1)*perPage}, ${perPage}`;
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

    // 讀取最新
    static async getLatest(){
      let sql =  "SELECT * FROM `articlelist` ORDER BY `aDate` DESC LIMIT 3"
      let [r] = await db.query(sql);
      return r      
    }

    // 讀取類別 
    static async getCate(aCategoryId){
      if(!aCategoryId) return null;
      let sql = "SELECT * FROM `articlelist` JOIN `acategorylist` ON `articlelist`.`aCategoryId` = `acategorylist`.`aCatId` WHERE `aCategoryId` =?"
      // 回傳取得類別資料的陣列
      let [r] = await db.query(sql, [aCategoryId]);
      if(!r || !r.length){
          return null;
      }
      return r; 
    }

    // 讀取類別5篇 
    static async getCateTop(aCategoryId){
      if(!aCategoryId) return null;
      let sql = "SELECT * FROM `articlelist` WHERE `aCategoryId` = ? ORDER BY `aDate` DESC LIMIT 5;"
      // 回傳取得類別資料的陣列
      let [r] = await db.query(sql, [aCategoryId]);
      if(!r || !r.length){
          return null;
      }
      return r; 
    }

    // 讀取單篇文章所帶多個標籤 (1 post to multiple tags)
    static async getArticleTag(aId){
        if(!aId) return null;
        let sql = "SELECT `articlelist`.`aId`, `ataglist`.`tagName`,`atagmap`.`tagId` FROM `atagmap` JOIN `articlelist` ON `articlelist`.`aId` = `atagmap`.`aId` JOIN `ataglist` ON `ataglist`.`tagId` = `atagmap`.`tagId` WHERE `articleList`.`aId` =?"
        // 回傳取得類別資料的陣列
        let [r] = await db.query(sql, [aId]);
        if(!r || !r.length){
            return null;
        }
        return r; 
    }

    // 讀取單一標籤所帶多篇文章 (1 tag to multiple posts)
    static async getTagFilterArticles(tagId){
        if(!tagId) return null;
        let sql = "SELECT `articleList`.`aId`, `articleList`.`aTitle`, `articleList`.`aImg`, `articleList`.`author`, `articleList`.`aContent`, `articleList`.`aCategoryId`, `articleList`.`aDate`,`articleList`.`created_at`, `articleList`.`updated_at`, `aCategoryList`.`aCatName`, `ataglist`.`tagName`, `ataglist`.`tagId` FROM `articleList`  INNER JOIN `aCategoryList` ON `articleList`.`aCategoryId` = `aCategoryList`.`aCatId` INNER JOIN `atagmap` ON `articlelist`.`aId` = `atagmap`.`aId` INNER JOIN `ataglist` ON `ataglist`.`tagId` = `atagmap`.`tagId` WHERE FIND_IN_SET(`atagmap`.`tagId`, ?)"
        // 回傳取得類別資料的陣列
        let [r] = await db.query(sql, [tagId]);
        if(!r || !r.length){
            return null;
        }
        return r; 
    }


    // 讀取單篇文章 
    static async getPost(aId){
        if(!aId) return null;
        let sql = "SELECT * FROM `articlelist` INNER JOIN `aCategoryList` ON `articleList`.`aCategoryId` = `aCategoryList`.`aCatId` WHERE `aId`=?"
        // 回傳取得單筆資料的陣列
        let [r] = await db.query(sql, [aId]);
        if(!r || !r.length){
            return null;
        }
        return r[0]; 
    }

    // 讀取分類名稱 on breadcrumb
      static async getCateName(aCategoryId){
        if(!aCategoryId) return null;
        let sql =  "SELECT * FROM `articlelist` JOIN `acategorylist` ON `articlelist`.`aCategoryId` = `acategorylist`.`aCatId` WHERE `aCategoryId` =?"
        let [r] = await db.query(sql, [aCategoryId]);
        if(!r || !r.length){
          return null;
        }
        return r[0];        
      }
    
    // 讀取標籤名稱 on breadcrumb
    static async getTagName(tagId) {
      if(!tagId) return null;
        let sql = "SELECT `articleList`.`aId`, `articleList`.`aTitle`, `articleList`.`aImg`, `articleList`.`author`, `articleList`.`aContent`, `articleList`.`aCategoryId`, `articleList`.`aDate`,`articleList`.`created_at`, `articleList`.`updated_at`, `aCategoryList`.`aCatName`, `ataglist`.`tagName`, `ataglist`.`tagId` FROM `articleList`  INNER JOIN `aCategoryList` ON `articleList`.`aCategoryId` = `aCategoryList`.`aCatId` INNER JOIN `atagmap` ON `articlelist`.`aId` = `atagmap`.`aId` INNER JOIN `ataglist` ON `ataglist`.`tagId` = `atagmap`.`tagId` WHERE FIND_IN_SET(`atagmap`.`tagId`, ?)"
        // 回傳取得類別資料的陣列
        let [r] = await db.query(sql, [tagId]);
        if(!r || !r.length){
            return null;
        }
        return r[0]; 
    } 

    // 讀取首頁最新標籤
    static async getTag(){
        let sql =  "SELECT * FROM `ataglist` ORDER BY `created_at` DESC LIMIT 8"
        let [r] = await db.query(sql);
        return {
          r
        }
    }

        // 新增留言板
    constructor(data){
      let defaultData = {
        cId: null,
        name: '',
        content: '',
        avatar: '[]',
        mId: 0,
        aId: 0,    
      };
      this.data = {...defaultData, ...data};
    }

    async add(){
      if(this.data.cId) {
        return false;
      }
      let sql = "INSERT INTO `acommentlist` SET ?";
      let [result] = await db.query(sql, [this.data]);
      return result.insertId;
    }
    
    // 讀取留言板
    static async getComment(aId){
      if(!aId) return null;
      let sql =  
      "SELECT * FROM `acommentlist`  JOIN `member` ON `acommentlist`.`mId` =  `member`.`mId` WHERE `aId` = ?"
      let [r] = await db.query(sql, [aId]);
      if(!r || !r.length){
        return null;
      }
      return r; 
    }
      
}

module.exports = Articles;
