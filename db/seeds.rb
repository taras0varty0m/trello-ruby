# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
password = Faker::Internet.password
user = User.create(email: Faker::Internet.email, password: password, password_confirmation: password)
column = user.columns.create(title: Faker::Book.title, user_id: user.id)
card = column.cards.create(title: Faker::Book.title, description: Faker::Lorem.sentence, user_id: user.id)
card.comments.create(text: Faker::Lorem.paragraph, user_id: user.id)
