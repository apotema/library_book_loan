# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Book.create(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald')
Book.create(title: 'The Catcher in the Rye', author: 'J. D. Salinger')
Book.create(title: 'The Grapes of Wrath', author: 'John Steinbeck')
Book.create(title: 'To Kill a Mockingbird', author: 'Harper Lee')
Book.create(title: 'The Color Purple', author: 'Alice Walker')
Book.create(title: 'Ulysses', author: 'James Joyce')
Book.create(title: 'Beloved', author: 'Toni Morrison')
Book.create(title: 'The Lord of the Flies', author: 'William Golding')

user = User.create(email: 'foo@bar.com', password: 'foobar', role: 'clerk')
user2 = User.create(email: 'user@user.com', password: 'userpassword')

Member.create(user:)
Member.create(user: user2)
