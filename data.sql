-- users
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from USA.')

-- posts
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post(user 1)')
second_post = Post.create(author: first_user, title: 'Hi', text: 'This is my second post(user 1)')
third_post = Post.create(author: first_user, title: 'Hola', text: 'This is my third post(user 1)')
forth_post = Post.create(author: first_user, title: 'Cześć', text: 'This is my forth post(user 1)')
firth_post = Post.create(author: second_user, title: 'Hello', text: 'This is my first post(user 2)')
sixth_post = Post.create(author: second_user, title: 'Hi', text: 'This is my second post(user 2)')
seventh_post = Post.create(author: second_user, title: 'Hola', text: 'This is my third post(user 2)')
eighth_post = Post.create(author: second_user, title: 'Cześć', text: 'This is my forth post(user 2)')

-- comments
first_comment = Comment.create(user: first_user, post: first_post, text: 'This is my first comment(user 1, post 1)')
second_comment = Comment.create(user: first_user, post: first_post, text: 'This is my second comment(user 1, post 1)')
third_comment = Comment.create(user: first_user, post: first_post, text: 'This is my third comment(user 1, post 1)')
forth_comment = Comment.create(user: first_user, post: first_post, text: 'This is my forth comment(user 1, post 1)')
fiveth_comment = Comment.create(user: first_user, post: first_post, text: 'This is my fiveth comment(user 1, post 1)')
sixth_comment = Comment.create(user: first_user, post: first_post, text: 'This is my sixth comment(user 1, post 1)')
seventh_comment = Comment.create(user: first_user, post: first_post, text: 'This is my seventh comment(user 1, post 1)')
eighth_comment = Comment.create(user: first_user, post: first_post, text: 'This is my eighth comment(user 1, post 1)')
nineth_comment = Comment.create(user: second_user, post: first_post, text: 'This is my first comment(user 2, post 1)')
tenth_comment = Comment.create(user: second_user, post: first_post, text: 'This is my second comment(user 2, post 1)')
eleventh_comment = Comment.create(user: second_user, post: first_post, text: 'This is my third comment(user 2, post 1)')
twelveth_comment = Comment.create(user: second_user, post: first_post, text: 'This is my forth comment(user 2, post 1)')
thirteenth_comment = Comment.create(user: second_user, post: first_post, text: 'This is my fiveth comment(user 2, post 1)')
