# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

Teacher.create!(
  email: 'teacher1@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

Teacher.create!(
  email: 'teacher2@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)


students = [
  { name: 'Alice Johnson', subject: 'Mathematics', marks: 85 },
  { name: 'Bob Smith', subject: 'Science', marks: 92 },
  { name: 'Charlie Brown', subject: 'English', marks: 78 },
  { name: 'Diana Prince', subject: 'History', marks: 88 },
  { name: 'Ethan Hunt', subject: 'Physical Education', marks: 95 }
]

students.each do |student|
  Student.create!(student)
end

puts "Students seeded."
