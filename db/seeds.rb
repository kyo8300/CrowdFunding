# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin_user = User.create!(
    email: ENV['EMAIL'],
    password: ENV['PASSWORD'],
    password_confirmation: ENV['PASSWORD'],
    admin: true
)

password = Faker::Internet.password
u1 = User.create!(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    admin: false
)

100.times do |n|
    title = Faker::Commerce.product_name
    subtitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    category = Faker::Number.between(from: 0, to: 7)
    goal = Faker::Number.number(digits: 3)
    duration = Faker::Time.between(from: DateTime.now, to: DateTime.now + 40)
    location = Faker::Number.between(from: 0, to: 2)
    story = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi 
        ut aliquip ex ea commodo consequat."
    u1.projects.create!(
        title: title,
        subtitle: subtitle,
        category: category,
        goal: goal,
        duration: duration,
        location: location,
        story: story,
        reviewing: true,
        reviewed: true
    )
end