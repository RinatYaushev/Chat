module Builder
  class User
    attr_accessor :firstname, :lastname, :posts, :comments
  end

  class Post; end
  class Comment; end

  class UserBuilder
    attr_reader :user

    def initialize firstname, lastname, posts = [], comments = []
      @user = Builder::User.new
      @user.firstname = firstname
      @user.lastname = lastname
      @user.posts = posts
      @user.comments = comments
    end

    def add_posts n
      n.times{ user.posts << Builder::Post.new }
    end

    def add_comments n
      n.times{ user.comments << Builder::Comment.new }
    end
  end
end

# builder = Builder::UserBuilder.new('Bob', 'Bobenko')

# user = builder.user
# puts user.firstname
# puts user.lastname

# builder.add_posts(10)
# builder.add_comments(7)
# puts "#{user.firstname} #{user.lastname} has #{user.posts.size} posts and #{user.comments.size} comments "
