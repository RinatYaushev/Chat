module Strategy
  class User
    attr_reader :posts, :comments, :roles
    attr_accessor :printer

    def initialize(printer)
      @printer = printer
      @posts = 10
      @comments = 5
      @roles = [:admin, :moderator]
    end

    def print_stats
      printer.print(posts, comments, roles)
    end
  end

  class ActivityStats
    def print(posts, comments, roles)
      "You have #{posts} posts and #{comments} comments"
    end
  end

  class RolesStats
    def print(posts, comments, roles)
      roles.inject(''){ |result, role| result + role.to_s.capitalize + ' ' }
    end
  end
end

user = Strategy::User.new(Strategy::ActivityStats.new).print_stats
puts user

user = Strategy::User.new(Strategy::RolesStats.new).print_stats
puts user
