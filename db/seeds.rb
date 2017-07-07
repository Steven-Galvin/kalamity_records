# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Record.destroy_all
Review.destroy_all
User.destroy_all

admin = User.create!(username: "Kalsifer",
                    name: "Admin",
                    sex: "Other",
                    dob: "1993-11-07 00:00:00 UTC",
                    avatar: File.new("#{Rails.root}/public/images/medium/missing.png"),
                    email: "admin@admin.com",
                    password: "asdfas",
                    password_confirmation: "asdfas",
                    admin: true,
                    id: 1
                    )

user1 = User.create!(username: "Vulpixies",
                    name: "User 1",
                    sex: "Female",
                    dob: "1994-12-24 00:00:00 UTC",
                    avatar: File.new("#{Rails.root}/public/images/medium/missing.png"),
                    email: "user1@user1.com",
                    password: "asdfas",
                    password_confirmation: "asdfas",
                    admin: false,
                    id: 2
                    )

user2 = User.create!(username: "Luigi290",
                     name: "User 2",
                     sex: "Male",
                     dob: "1995-1-2 00:00:00 UTC",
                     avatar: File.new("#{Rails.root}/public/images/medium/missing.png"),
                     email: "user2@user2.com",
                     password: "asdfas",
                     password_confirmation: "asdfas",
                     admin: false,
                     id: 3
                     )

25.times do |index|
  Record.create!(title: Faker::Book.title,
                 artist: Faker::Zelda.character,
                 price: rand(5..25),
                 description: Faker::Lorem.sentence(20, false, 0).chop,
                 genre: ["Hip-Hop", "Classic Rock", "Pop", "Country", "EDM", "Alternative", "Indie", "Singer Songwriter", "Dance"].sample,
                 album_length: rand(10..90),
                 id: index + 1
                 )
end

100.times do |index|
  Review.create!(content: Faker::Lorem.sentence(20, false, 0).chop,
                 rating: rand(1..5),
                 record_id: rand(1..25),
                 user_id: rand(1..3)
                 )
end

p "Created #{Record.count} Records"
p "Created #{User.count} Users"
p "Created #{Review.count} Reviews"
