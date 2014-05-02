require 'sqlite3'

class DB
  def self.register_user user_hash
    db = SQLite3::Database.new("ats.db")
    db.execute("INSERT INTO users " +
      "(first_name, last_name, email, location, genre)" +
      " VALUES (?, ?, ?, ?, ?)",
      [
        user_hash["first_name"],
        user_hash["last_name"],
        user_hash["email"],
        user_hash["location"],
        user_hash["genre"]
      ]
    )
  end
end
