module Iterator
  class Hero
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end

  class Heroes
    def initialize
      @heroes = []
    end

    def add_hero(name)
      @heroes << Iterator::Hero.new(name)
    end

    def heroes
      @heroes
    end
  end
end

all = Iterator::Heroes.new
all.add_hero('Warrior')
all.add_hero('Mage')
all.add_hero('Druid')
all.add_hero('Shaman')
all.add_hero('Rogue')
all.heroes.each { |hero| puts hero.name }
