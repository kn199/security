user_1 = User.create!(name: "user_name_1", email: "user_1@email.com", password: "password")
user_2 = User.create!(name: "user_name_2", email: "user_2@email.com", password: "password")
user_3 = User.create!(name: "user_name_3", email: "user_3@email.com", password: "password")

post_1 = Post.create!(user_id: user_1.id, title: "title_1",
  description: "本文_1")
post_2 = Post.create!(user_id: user_2.id, title: "title_2",
  description: "本文_2")
post_3 = Post.create!(user_id: user_3.id, title: "title_3",
  description: "本文_3")
