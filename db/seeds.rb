# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Candidate.create(name: 'Петров', fee: 100000)
Candidate.create(name: 'Иванов', fee: 10000)
Skill.create(name: 'C++')
Skill.create(name: 'Java')
Skill.create(name: 'Scala')
Skill.create(name: 'Python')

Vacancy.create(name: 'Разработчик C++', fee: 100000.0, expire_at: Time.now + 100.days, added_at: Time.now, contact_info: 'me@hr.example.com')
Vacancy.create(name: 'Разработчик Ruby', fee: 20000.0, expire_at: Time.now + 100.days, added_at: Time.now, contact_info: 'me@hr.example.ru')