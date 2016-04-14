module Decorator
  class ItemDecorator
    def initialize(item)
      @item = item
    end
  end

  class SwordDecorator < ItemDecorator
    def price
      @item.price * 3
    end

    def description
      @item.description + 'Sword'
    end
  end

  class BowDecorator < ItemDecorator
    def price
      @item.price * 2
    end

    def description
      @item.description + 'Bow'
    end
  end

  class Item
    attr_reader :price, :description

    def initialize
      @price = 10
      @description = 'Item '
    end
  end
end

item = Decorator::Item.new
sword = Decorator::SwordDecorator.new(item)
puts "#{sword.description} cost #{sword.price}"

bow = Decorator::BowDecorator.new(item)
puts "#{bow.description} cost #{bow.price}"
