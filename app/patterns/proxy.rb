module Proxy
  class User
    attr_accessor :keywords

    def initialize keywords = []
      @keywords = keywords
    end
  end

  class ComputerProxy
    def initialize user
      @user = user
    end

    def check_access
      raise "You have no access" unless @user.keywords.include?(:some_keyword)
    end

    def real_object
      Proxy::Computer.new
    end

    def execute
      check_access
      real_object.execute
    end
  end

  class Computer
    def execute
      puts "executing commands"
    end
  end
end

# user = Proxy::User.new
# proxy = Proxy::ComputerProxy.new(user)
# user.keywords << :some_keyword        # comment this line to check access
# proxy.execute
