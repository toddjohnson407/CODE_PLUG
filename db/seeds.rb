# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Subject.destroy_all

Subject.create(category: 'Ruby')
Subject.create(category: 'JavaScript')
Subject.create(category: 'Python')
Subject.create(category: 'HTML/CSS')
Subject.create(category: 'C++')
Subject.create(category: 'Swift')
Subject.create(category: 'Perl')
Subject.create(category: 'Assembly')
