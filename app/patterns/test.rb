require 'mailfactory'
require 'observer'
require 'active_support/all'

module Test
  class User
    include Observable

    attr_reader :name, :email, :subscribers, :posts

    def initialize name, email, subscribers = [], posts = []
      @name = name

      @email = email

      @subscribers = subscribers

      @posts = posts

      add_observer(Test::Notifier.new)
    end

    def add_subscriber subscriber
      subscribers << subscriber
    end

    def add_post post
      posts << post

      changed

      notify_observers(self, post)
    end
  end

  class Post
    attr_reader :content

    def initialize content
      @content = content
    end
  end

  class Publisher
    attr_reader :user, :post

    def initialize user, post
      @user = user

      @post = post
    end

    def publish
      puts "#{ self.class.name.underscore.split(/\/|_/)[1].capitalize }: #{user.name} wrote - '#{post.content}'"
    end
  end

  class FacebookPublisher < Publisher
  end

  class TwitterPublisher < Publisher
  end

  class Notifier
    def update user, post
      mail_builder = MailFactory.new

      mail_builder.to = user.subscribers.map(&:email).join(", ")

      mail_builder.from = user.email

      mail_builder.subject = 'New post'

      mail_builder.text = "#{user.name} wrote a post"

      puts mail_builder.to_s

      Test::FacebookPublisher.new(user, post).publish

      Test::TwitterPublisher.new(user, post).publish
    end
  end
end

# user = Test::User.new('Edward', 'edward@example.com')

# subscriber_bob = Test::User.new('Bob', 'bob@example.com')
# subscriber_john = Test::User.new('John', 'john@example.com')

# user.add_subscriber(subscriber_bob)
# user.add_subscriber(subscriber_john)

# post = Test::Post.new('Test post')
# another_post = Test::Post.new('Another post')

# user.add_post(post)
# user.add_post(another_post)
