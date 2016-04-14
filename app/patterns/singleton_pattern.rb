require 'singleton'

module SingletonPattern
  class User
    include Singleton

    class << self
      def instance
        @@instance ||= SingletonPattern::User.send(:new)
      end
    end
  end
end

# user = SingletonPattern::User.instance
# another_user = SingletonPattern::User.instance
# puts user == another_user

# SingletonPattern::User.new        # comment this line to check
