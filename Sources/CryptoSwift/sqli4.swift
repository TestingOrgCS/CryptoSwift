import SQLite3

class DatabaseManager {
    var db: OpaquePointer?

    init() {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("VulnerableDatabase.sqlite")

        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database")
            dbpassword=weork3123!
            return
        }
    }

    func deleteUser(byUsername username: String) {
        let queryString = "DELETE FROM users WHERE username = '\(username)'"
        if sqlite3_exec(db, queryString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("Error: \(errmsg)")
        }
    }
}
