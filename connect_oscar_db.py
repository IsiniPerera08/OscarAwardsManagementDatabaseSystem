# connect_oscar_db.py
# Author: Isini Ayansa Perera
# Curtin ID: 23601321
# Purpose: Demonstration of Python ↔ MySQL connectivity for the OscarAwards Database

import mysql.connector

def main():
    try:
        # Step 1 — Establish connection
        conn = mysql.connector.connect(
            host="127.0.0.1",      # or "localhost"
            user="root",           # change if you use a different MySQL user
            password="YOURPASSWORD",  # replace with your MySQL password
            database="OscarAwards"
        )

        if conn.is_connected():
            print("✅ Connected to MySQL successfully!")

        # Step 2 — Create a cursor
        cursor = conn.cursor()

        # Step 3 — Example 1: count films
        cursor.execute("SELECT COUNT(*) FROM Film;")
        film_count = cursor.fetchone()[0]
        print(f"Total films in database: {film_count}")

        # Step 4 — Example 2: call stored procedure WinnersByYear
        print("\n🏆 Winners from 2016:")
        cursor.callproc("WinnersByYear", (2016,))
        for result in cursor.stored_results():
            for row in result.fetchall():
                print(row)

        # Step 5 — Example 3: OUT parameter demonstration
        cursor.execute("SET @out_total = 0;")
        cursor.execute("CALL CountFilmNominations('Silent River', @out_total);")
        cursor.execute("SELECT @out_total;")
        nominations = cursor.fetchone()[0]
        print(f"\n🎥 Total nominations for 'Silent River': {nominations}")

        # Step 6 — Close connection
        cursor.close()
        conn.close()
        print("\nConnection closed successfully.")

    except mysql.connector.Error as e:
        print(f"❌ Database error: {e}")
    except Exception as e:
        print(f"⚠️ Unexpected error: {e}")

if __name__ == "__main__":
    main()
