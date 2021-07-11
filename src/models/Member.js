// 會員 SQL
class User {
  constructor(id,email, password, fName, lName,nickname , birthday, phone, gender, avatar) {
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
  }

  // 新增會員
  addUserSQL() {
    let sql = `INSERT INTO member(email, password, created_at) \
                   VALUES('${this.email}', '${this.password}', NOW())`
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

  
  // static是與實例化無關
  static getUserByIdSQL(id) {
    let sql = `SELECT * FROM Member WHERE mId = ${id}`
    return sql
  }


}

module.exports = User;
