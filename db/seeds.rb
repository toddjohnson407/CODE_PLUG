# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.destroy_all
Subject.destroy_all
Message.destroy_all
Chat.destroy_all
User.destroy_all

Subject.create(category: 'Ruby')
Subject.create(category: 'JavaScript')
Subject.create(category: 'Python')
Subject.create(category: 'HTML/CSS')
Subject.create(category: 'C++')
Subject.create(category: 'Swift')
Subject.create(category: 'Perl')
Subject.create(category: 'Assembly')


20.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name , email: Faker::Internet.email, password:"123456", phone_number: Faker::PhoneNumber.cell_phone)
  puts "student created"
end

up = 0
places = ["Cais Do Sodre", "Sintra", "Saldanha", "Belem Tower", "Alfama", "Sao Jorge Castle", "Praca do Comercio", "Bairro Alto", "Santa Justa Lift", "Lisbon Oceanarium"]
category = ['Assembly', 'Ruby', 'JavaScript', 'Python', 'HTML/CSS', 'C++', 'Swift', 'Perl']
amount = (10..100).to_a
num = (1..8).to_a

10.times do
  User.create(location: places[up], current_position: "Fullstack Developer", languages: "JavaScript, Python, and Ruby", teacher: true, description: "I am a fullstack web developer that has a passion for teaching and would be happy to teach anyone how to program.", first_name: Faker::Name.first_name, last_name: Faker::Name.first_name , email: Faker::Internet.email, password:"123456", phone_number: Faker::PhoneNumber.cell_phone)
  up += 1
  puts "teacher created"
end

User.all.each do |user|
  if user.teacher?
    puts user.id
    8.times do
      course = Course.create(subject: Subject.all.sample, user: user, city: "Lisbon", requirement: "No previous computer programming experience required.", learning: "Basics of Web Dev", title: "Intro to Web Development", price: amount.sample.to_i, description: "Come learn the essentials of simple application and web development.",
        address: places.sample.to_s)
      if course.save
        puts "Success creating this course #{course.title}"
      end
    end
  end
end
