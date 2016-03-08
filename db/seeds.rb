# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Category.delete_all

User.create!(username: "Marshall", password: "password", status: "admin")
User.create!(username: "Jim", password: "password", status: "admin")
User.create!(username: "Meagan", password: "password", status: "admin")
User.create!(username: "James", password: "password", status: "admin")
User.create!(username: "Sabri", password: "password", status: "admin")

Category.create!(title: "Trains")
Category.create!(title: "Planes")

