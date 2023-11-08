# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Book.create(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald')
Book.create(title: 'Bla', author: 'Ble')
Book.create(title: 'Foo', author: 'Bar')

user = User.create(email: 'foo@bar.com', password: 'foobar', role: 'clerk')
user2 = User.create(email: 'user@user.com', password: 'userpassword')

Member.create(user:)
Member.create(user: user2)
