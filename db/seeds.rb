# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Candidate.create(name: 'Петров', fee: 100000)
Skill.create(name: 'C++')
Vacancy.create(name: 'Разработчик C++', fee: 100000.0, expire_at: Time.now + 100.days, added_at: Time.now, contact_info: 'me@hr.example.com')