module Template
  class Hero
    attr_reader :abilities

    DAMAGE_RATING = 10

    def initialize
      @abilities = occupation_abilities
    end

    def greet
      ["Hello"] << unique_greeting_line
    end

    def unique_greeting_line
      raise "You must define unique_greeting_line"
    end

    def damage_rating
      DAMAGE_RATING
    end

    def occupation_abilities
      []
    end
  end

  class Warrior < Hero
    DAMAGE_RATING = 15

    def damage_rating
      DAMAGE_RATING
    end

    def occupation_abilities
      [:strike]
    end

    def unique_greeting_line
      "Warrior is ready to fight!"
    end
  end

  class Mage < Hero
    DAMAGE_RATING = 7

    def damage_rating
      DAMAGE_RATING
    end

    def occupation_abilities
      [:magic_spell]
    end

    def unique_greeting_line
      "Mage is ready to make powerful spells!"
    end
  end
end

# warrior = Template::Warrior.new
# puts warrior.greet
# puts "I can strike for #{warrior.damage_rating} damage !!!"

# mage = Template::Mage.new
# puts mage.greet
# puts "I can cast fireball for #{mage.damage_rating} damage !!!"
