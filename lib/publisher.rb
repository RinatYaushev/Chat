class Publisher
  attr_reader :user, :post

  def initialize user, post
    @user = user

    @post = post
  end

  def publish
    puts "#{ self.class.name.underscore.split('_')[0].capitalize }: #{user.name} wrote - '#{post.content}'"
  end
end
