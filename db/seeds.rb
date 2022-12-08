# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_one = User.create(name: 'Ernest', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Ghana.', posts_counter: 0, email: 'ernest@gmail.com, password: '@123456')

user_two = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Ivory Cost.', posts_counter: 0, email: 'johnarren@yahoo.com', password: '123456@')

first_post = Post.create(author: user_one, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                          likes_counter: 0)

second_post = Post.create(author: user_one, title: 'Second', text: 'This is my second post', comments_counter: 0,
likes_counter: 0)

third_post = Post.create(author: user_one, title: 'Third', text: 'This is my third post', comments_counter: 0, likes_counter: 0)

fourth_post = Post.create(author: user_one, title: 'Fourth', text: 'This is my third post', comments_counter: 0, likes_counter: 0)

fifth_post = Post.create(author: user_one, title: 'Five', text: 'This is my third post', comments_counter: 0,likes_counter: 0)

first_comment = Comment.create(post: first_post, author: 1, text: 'Hi Tom!')

second_comment = Comment.create(post: first_post, author: user_one, text: 'This is the second comment')

third_comment = Comment.create(post: first_post, author: user_one, text: 'This is the third comment')

fourth_comment = Comment.create(post: first_post, author: user_one, text: 'This is the fourth comment')

fifth_comment = Comment.create(post: first_post, author: user_one, text: 'This is the fifth comment')

sixth_comment = Comment.create(post: first_post, author: user_one, text: 'This is the sixth comment')

seventh_comment = Comment.create(post: first_post, author: user_one, text: 'This is the seventh comment')
