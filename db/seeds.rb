namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_instaposts
    make_relationships
  end
end

def make_users
    9.times do |n|
    name  = Faker::Name.name
    email = "ex-#{n+1}@gmail.com"
    password  = "123456"
    User.create!(name:     name,
                 email:    email,
                 password: 123456,
                 password_confirmation: 123456)
  end
end

def make_instaposts
  users = User.all(limit: 6)
  5.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.instaposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end