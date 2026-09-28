require 'sqlite3'

db = SQLite3::Database.new("quiz.db")

puts "🧹 Tar bort gamla tabeller..."
db.execute('DROP TABLE IF EXISTS questions')

puts "🧱 Skapar tabeller..."
db.execute('CREATE TABLE questions (
            type TEXT,
            prompt TEXT,
            answer TEXT,
            alternatives TEXT)')

puts "🍎 Fyller på med data..."
db.execute('INSERT INTO questions (type, prompt, answer, alternatives) VALUES ("Question", "Vad heter huvudstaden i Norge?", "Oslo", "")')
db.execute('INSERT INTO questions (type, prompt, answer, alternatives) VALUES ("Question", "Vilket år släpptes Ruby 1.0?", "1996", "")')
db.execute('INSERT INTO questions (type, prompt, answer, alternatives) VALUES ("Question", "Vad svarar 5.class?",  "Integer", "")')
db.execute('INSERT INTO questions (type, prompt, answer, alternatives) VALUES ("Multi", "När släpptes ruby 1.2?", "1998", "1997, 1998, 1999")')
db.execute('INSERT INTO questions (type, prompt, answer, alternatives) VALUES ("TrueOrFalse", "Året är 2026", "true", "")')
db.execute('INSERT INTO questions (type, prompt, answer, alternatives) VALUES ("TrueOrFalse", "Året är 2025", "false", "")')
db.execute('INSERT INTO questions (type, prompt, answer, alternatives) VALUES ("Numeric", "15+3", "18", "")')
db.execute('INSERT INTO questions (type, prompt, answer, alternatives) VALUES ("SelfGraded", "Förklara inkapsling med en mening.", "Objektet bestämmer själv vad som går att nå utifrån.", "")')


puts "✅ Databasen är seedad!"
