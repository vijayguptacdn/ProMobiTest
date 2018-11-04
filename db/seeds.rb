# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Project.destroy_all
User.destroy_all
Role.destroy_all

r1 = Role.create({name: "Manager", description: "Can do Everything"})
r2 = Role.create({name: "Developer", description: "Can read and write task"})

u1 = User.create({name: "vijay", email: "vijay@promobi.com", password: "12345678", password_confirmation: "12345678", role_id: r1.id})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "12345678", password_confirmation: "12345678", role_id: r2.id})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "12345678", password_confirmation: "12345678", role_id: r2.id})

i1 = Project.create({name: "Rayban Sunglasses", description: "Stylish shades", user_id: u1.id})

names = ['new', 'inprogress', 'done']
names.each do |name|
  StatusType.create(name: name)
end