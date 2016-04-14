module Factory
  class Man; end
  class Woman; end

  class PeopleFactory
    def create_man
      Factory::Man.new
    end

    def create_woman
      Factory::Woman.new
    end
  end

  class Office
    attr_reader :members

    def initialize(factory)
      @members = []
      @factory = factory
    end

    def add_men(n)
      n.times{ @members << @factory.create_man }
    end

    def add_women(n)
      n.times{ @members << @factory.create_woman }
    end
  end
end

office = Factory::Office.new(Factory::PeopleFactory.new)
office.add_men(25)
office.add_women(15)

puts office.members.size
puts office.members.count{ |member| member.class == Factory::Man }
puts office.members.count{ |member| member.class == Factory::Woman }
