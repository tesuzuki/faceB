# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
    email = Faker::Internet.email
    password="password"
    name=Faker::Name.name
    user=User.new(email: email,
                    password: password,
                    password_confirmation: password,
                    name: name,
                    provider: "",
                    uid: SecureRandom.uuid,
                    avatar: "nil")
    user.skip_confirmation!
    user.save
    
    title = Faker::Book.title
    content=title+"is nice!"
    topic=Topic.new(title: title,
                    content: content,
                    user_id: user.id)
    topic.save
    
    content="私の投稿です。"
    Comment.create!(content: content,
                    user_id: user.id,
                    topic_id: topic.id)
end
 