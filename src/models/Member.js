// 會員 SQL
class User {
  constructor(name, email, password) {
    this.id = 0
    this.email = email
    this.password = password
  }

  // 新增會員
  addUserSQL() {
    let sql = `INSERT INTO member(email, password, created_at) \
                   VALUES('${this.email}', '${this.password}', NOW())`
    return sql
  }

  // login用
  getUserUserByUsernameAndPasswordSQL() {
    let sql = `SELECT * FROM Member WHERE email = '${this.email}' AND password = '${this.password}' LIMIT 0,1`
    return sql
  }
}

module.exports = User;
