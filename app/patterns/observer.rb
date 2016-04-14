require 'observer'

module Observer
  class User
    include Observable

    attr_reader :name, :surname, :salary

    def initialize(name, surname, salary)
      @name = name
      @surname = surname
      @salary = salary
      add_observer(Observer::Notifier.new)
    end

    def name=(new_name)
      @name = new_name
      changed
      notify_observers(self)
    end

    def surname=(new_surname)
      @surname = new_surname
      changed
      notify_observers(self)
    end

    def salary=(new_salary)
      @salary = new_salary
      changed
      notify_observers(self)
    end
  end

  class Notifier
    def update(user)
      puts("Now your name is #{user.name}")
      puts("Now your name is #{user.surname}")
      puts("Your salasry is #{user.salary}")
    end
  end
end

user = Observer::User.new('Bob', 'Bobenko', 30000)
user.name = 'Vova'
user.surname = 'Vovenko'
user.salary = 100000
