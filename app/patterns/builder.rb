module Builder
  class User
    attr_accessor :name, :surname, :posts, :comments
  end

  class Post; end
  class Comment; end

  class UserBuilder
    def initialize(name, surname)
      @user = Builder::User.new
      @user.name = name
      @user.surname = surname
      @user.posts = []
      @user.comments = []
    end

    def add_posts(n)
      n.times{ @user.posts << Builder::Post.new }
    end

    def add_comments(n)
      n.times{ @user.comments << Builder::Comment.new }
    end

    def user
      @user
    end
  end
end

builder = Builder::UserBuilder.new('Bob', 'Bobenko')

user = builder.user
puts user.name
puts user.surname

builder.add_posts(10)
puts "#{user.name} has #{user.posts.size} posts"

builder.add_comments(7)
puts "#{user.name} has #{user.comments.size} comments"
Raw
