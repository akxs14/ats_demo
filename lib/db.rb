require 'sqlite3'
require 'json'

class DB
  def self.register_user user_hash
    db = get_db_conn
    db.execute("INSERT INTO users " +
      "(first_name, last_name, email, location, genre, NFC)" +
      " VALUES (?, ?, ?, ?, ?, ?)",
      [
        user_hash["first_name"],
        user_hash["last_name"],
        user_hash["email"],
        user_hash["location"],
        user_hash["genre"],
        read_nfc
      ]
    )
  end

  def self.get_user user_id
    db = get_db_conn
    db.execute("SELECT * FROM users WHERE id = ?", [user_id]) do |row|
      return row ? pack_json(row) : {user: "not found"}.to_json
    end
  end

  private

  def self.pack_json user_data
    {
      id: user_data[0],
      first_name: user_data[1],
      last_name: user_data[2],
      email: user_data[3],
      location: user_data[4],
      genre: user_data[5],
      nfc: user_data[6]
    }.to_json
  end

  def self.get_db_conn
    SQLite3::Database.new("ats.db")
  end

  def self.read_nfc
    SecureRandom.uuid
  end
end
