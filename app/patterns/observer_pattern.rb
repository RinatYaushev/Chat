require 'observer'

module ObserverPattern
  class User
    include Observable

    attr_reader :firstname, :lastname, :salary

    def initialize firstname, lastname, salary
      @firstname = firstname
      @lastname = lastname
      @salary = salary
      add_observer(ObserverPattern::Notifier.new)
    end

    def firstname= new_firstname
      @firstname = new_firstname
      changed
      notify_observers(self)
    end

    def lastname= new_lastname
      @lastname = new_lastname
      changed
      notify_observers(self)
    end

    def salary= new_salary
      @salary = new_salary
      changed
      notify_observers(self)
    end
  end

  class Notifier
    def update user
      puts("Now your firstname is #{user.firstname}")
      puts("Now your lastname is #{user.lastname}")
      puts("Your salary is #{user.salary}")
    end
  end
end

# user = ObserverPattern::User.new('Bob', 'Bobenko', 30000)
# user.firstname = 'Vova'
# user.lastname = 'Vovenko'
# user.salary = 100000
