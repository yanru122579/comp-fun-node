// 會員 SQL
class User {
  constructor(id,email, password, fName, lName,nickname , birthday, phone, gender, avatar, country, township, naa, newPassword) {
    this.id = 0
    this.email = email
    this.password = password
    this.fName = fName
    this.lName  = lName
    this.nickname  = nickname
    this.birthday  = birthday
    this.phone  = phone
    this.gender  = gender
    this.avatar = avatar
    this.country = country
    this.	township = 	township
    this.naa = naa
    this.newPassword = newPassword
  }

  // 新增會員
  addUserSQL() {
    let sql = `INSERT INTO member(email, password, created_at) \
                   VALUES('${this.email}', '${this.password}', NOW())`
    return sql
  }
  // 新增地址
  addAdressSQL(id) {
    let sql = `INSERT INTO addressbook(mId, country, township, naa, created_at) \
              VALUES('${id}', '${this.country}','${this.township}','${this.naa}', NOW())`
    return sql
  }
  // 修改地址
  updateAdressSQL(id) {
    let sql = `UPDATE addressbook \
              SET country = '${this.country}', township = '${this.township}',\
              naa = '${this.naa}' WHERE addressId = ${id}`
    return sql
  }

  // 刪除地址
  static deleteUserByIdSQL(id) {
    let sql = `DELETE FROM addressbook WHERE addressId = ${id}`
    return sql
  }

  // 更新個人資料
  updateUserByIdSQL(id) {
    let sql = `UPDATE member \
               SET fName = '${this.fName}',lName = '${this.lName}', nickname = '${this.nickname}', phone = '${this.phone}', birthday = '${this.birthday}', gender = '${this.gender}' \
               WHERE mId =  ${id}`
    return sql
  }
  // 更新大頭貼
  updateUserAvatarByIdSQL(id) {
    let sql = `UPDATE member \
               SET avatar = '${this.avatar}' \
               WHERE mId =  ${id}`
    return sql
  }

  // login用
  getUserUserByUsernameAndPasswordSQL() {
    let sql = `SELECT * FROM Member WHERE email = '${this.email}' LIMIT 0,1`
    return sql
  }
  // 檢查密碼用用
  getPasswordSQL(mId) {
    let sql = `SELECT * FROM Member WHERE mId = '${mId}' LIMIT 0,1`
    return sql
  }
  // 更新密碼用用
  putPasswordSQL(mId,userNewPassword) {
    let sql = `UPDATE Member \
              SET password = '${userNewPassword}' WHERE mId = '${mId}' `
    return sql
  }

  

  
  // static是與實例化無關
  static getUserByIdSQL(id) {
    let sql = `SELECT * FROM Member WHERE mId = ${id}`
    return sql
  }
  // static是與實例化無關
  static getUserAddressByIdSQL(id) {
    let sql = `SELECT * FROM addressbook WHERE mId = ${id}`
    return sql
  }


}

module.exports = User;
