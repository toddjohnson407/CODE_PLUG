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


2.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name , email: Faker::Internet.email, password:"123456", phone_number: Faker::PhoneNumber.cell_phone)
  puts "student created"
end

up = 0
places = ["Cais Do Sodre", "Sintra", "Saldanha", "Belem Tower", "Alfama", "Sao Jorge Castle", "Praca do Comercio", "Bairro Alto", "Santa Justa Lift", "Lisbon Oceanarium"]
category = ["Assembly", "Ruby", "JavaScript", "Python", "HTML/CSS", "C++", "Swift", "Perl"]
amount = (10..100).to_a
num = (1..8).to_a

3.times do
  User.create(location: places[up], current_position: "Fullstack Developer", languages: "JavaScript, Python, and Ruby", teacher: true, description: "I am a fullstack web developer that has a passion for teaching and would be happy to teach anyone how to program.", first_name: Faker::Name.first_name, last_name: Faker::Name.first_name , email: Faker::Internet.email, password:"123456", phone_number: Faker::PhoneNumber.cell_phone)
  up += 1
  puts "teacher created"
end

User.all.each do |user|
  if user.teacher?
    puts user.id
    course = Course.create!(subject: Subject.all[1], user: user, city: "Lisbon", requirement: "No previous computer programming experience required.", learning: "JavaScript for Beginners", title: "Javascript Beginners", price: 23,
      description: "Come learn the basics and essentials of JavaScript. This tutorial is an introduction to programming in general, through the medium of JavaScript. We’ll get into interacting with web pages in the Intermediate section. Look at my other courses for more information",
      address: "R. da Rosa 2611200-119 Lisboa", remote_photo_url:"http://res.cloudinary.com/arthurpfister/image/upload/v1527849942/goran-ivos-343495-unsplash.jpg", remote_document_1_url: "https://www.evl.uic.edu/luc/bvis546/Essential_Javascript_--_A_Javascript_Tutorial.pdf", remote_document_2_url: "", video:"BEJ3d6IgmVk")


    course1 = Course.create!(subject: Subject.all[1], user: user, city: "Lisbon", requirement: "Basics of JavaScript are required. For more informations just send me a message.", learning: "DOM, Events & Callbacks, AJAX, JSON and jQuery", title: "Intermediate level: JavaScript", price: 32,
      description: "The DOM: The DOM as a tree of elements. Parents and children. Events and Callbacks: Event-driven programming. Listening for events, and acting on them with callback functions. AJAX: Asynchronous JavaScript And XML? What? Why? JSON: JavaScript Object Notation. And the Argonauts. Scope: What scope is and how JavaScript, yet again, does it differently. jQuery: What’s a DOM library for and why would you choose jQuery?",
      address: "R. Moeda 7, 1200-109 Lisboa", remote_photo_url:"http://res.cloudinary.com/arthurpfister/image/upload/v1528708271/di60k5pb5npno84vfphr.jpg", remote_document_1_url: "https://www.evl.uic.edu/luc/bvis546/Essential_Javascript_--_A_Javascript_Tutorial.pdf", remote_document_2_url: "", video:"zPHerhks2Vg")


    course2 = Course.create!(subject: Subject.all[1], user: user, city: "Lisbon", requirement: "DEEP understanding of DOM, Events & Callbacks, AJAX, JSON and jQuery. Junior Developer Level required.", learning: "specifical problemsolving with JavaScript, custom made depending on what you know and don't know and in which direction you want to go.", title: "JavaScript: Advanced", price: 52,
      description: "JavaScript is huge. Like, really big. Like a bus. For elephants. Injected with growth hormones. In this guide we’ll look at some of the numerous more advanced aspects of programming with the language. This will be slow hard problemsolving but it will be absolutely necessary to take your skills to an unpresent level. Welcome to the dark side hehe.",
      address:"1249-079, R. Santos-O-Velho 5, 1200-109 Lisboa", remote_photo_url:"http://res.cloudinary.com/arthurpfister/image/upload/v1527849962/rawpixel-550994-unsplash.jpg", remote_document_1_url: "https://www.evl.uic.edu/luc/bvis546/Essential_Javascript_--_A_Javascript_Tutorial.pdf", remote_document_2_url: "", video:"HcW5-P2SNec")


    course3 = Course.create!(subject: Subject.all[1], user: user, city: "Lisbon", requirement: "No previous computer programming experience required.", learning: "Basics of Web Development with Javascript.", title: "Intro to Web Dev", price: 20,
      description: "Come learn the essentials of simple application and web development through JavaScript and all the benefits that comes with it.",
      address:"Rua dos Bacalhoeiros, 1100-135 Lisboa", remote_photo_url:"http://res.cloudinary.com/arthurpfister/image/upload/v1528218488/clark-tibbs-367075-unsplash.jpg", remote_document_1_url: "https://www.evl.uic.edu/luc/bvis546/Essential_Javascript_--_A_Javascript_Tutorial.pdf", remote_document_2_url: "", video:"BEJ3d6IgmVk")

    # 3.times do

    #   review = Review.create!()
    # end

    # course4 = Course.create!(subject: Subject.all[0], user: user, city: "Lisbon", requirement: "None", learning: "Ruby Basics", title: "Ruby Step 1", price: 18,
    #   description: "Ruby is the best way to start working on your programming skills and your computational thinking.",
    #   address: "R. do Duque 9, 1200-158 Lisboa")

    # course5 = Course.create!(subject: Subject.all[0], user: user, city: "Lisbon", requirement: "No previous computer programming experience required.", learning: "Following your dreams the best way: with Ruby", title: "Programming is Creation", price: 34,
    #   description: "Programming is creation. Whenever you run a program a little universe is created. Things come to life and interact with each other, according to the rules that you, as their creator, define.
    #   Imagine you build an application like Twitter. Then, as a developer, in the programming language of your choice, you would say things like “Let there be users! And let there be tweets!”, and once your application starts these things will come into existence. Next you would go ahead and define “Users can create tweets, and they can follow each other”. And from now on, every time new users are created in the little universe that is your application, these users will have the ability to tweet and follow each other.",
    #   address: "Av. da Liberdade 2, 1250-144 Lisboa")

    # course6 = Course.create!(subject: Subject.all[0], user: user, city: "Lisbon", requirement: "Deep understanding and knowledge in the Ruby language.", learning: "Advanced Ruby", title: "Advanced Ruby", price: 50,
    #   description: "Ruby is big. Like, really big. Like a bus. For elephants. Injected with growth hormones. In this guide we’ll look at some of the numerous more advanced aspects of programming with the language.",
    #   address: "Tv. Santa Teresa 28, 1200-405 Lisboa")


    # course7 = Course.create!(subject: Subject.all[3], user: user, city: "Lisbon", requirement: "No previous computer programming experience required.", learning: "Basics of Web Development with HTML/CSS", title: "Basics of HTML/CSS", price: 17,
    #   description: "In this track, you will learn the building blocks of HTML and CSS in order to create and style your first web page from scratch.",
    #   address: "R. Patrocínio 26-b, 1350-229 Lisboa")

    # course8 = Course.create!(subject: Subject.all[3], user: user, city: "Lisbon", requirement: "Notions of design always a plus.", learning: "attractive, modern, minimalist landing pages that catch attention.", title: "Landing Page: HTML/CSS", price: 37,
    #   description: "Learn the essentials of making an attractive Landing Page: the most important page of any website to lead the way to success.",
    #   address:"R. Sousa Martins 7, 1050-009 Lisboa")

    # course9 = Course.create!(subject: Subject.all[3], user: user, city: "Lisbon", requirement: "No previous computer programming experience required.", learning: "Basics of Web Dev", title: "Basics Web Development", price: 59,
    #   description: "Come learn the essentials of simple application and web development.",
    #   address: "70, R. Pascoal de Melo, 1000-102 Lisboa")



    # course10 = Course.create!(subject: Subject.all[2], user: user, city: "Lisbon", requirement: "No previous computer programming experience required.", learning: "Basics of Python", title: "Basics of Python", price: 27,
    #   description: "Come learn the essentials of simple application and web development.",
    #   address: "R. Infantaria 16 30, 1250-096 Lisboa")

    # course11 = Course.create!(subject: Subject.all[2], user: user, city: "Lisbon", requirement: "Basics of Python absolutely necessary to complete this course. Short introduction in general Data Science included.", learning: "Data Science with Python", title: "Python & Data", price: 51,
    #   description: "Come learn the essentials of simple application and web development.",
    #   address: "R. de Borges Carneiro 38A, 1200-661 Lisboa")



  end
end
