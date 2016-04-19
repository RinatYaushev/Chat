module Decorator
  class ItemDecorator
    def initialize item
      @item = item
    end
  end

  class SwordDecorator < Decorator::ItemDecorator
    def price
      @item.price * 3
    end

    def description
      @item.description + 'Sword'
    end
  end

  class BowDecorator < Decorator::ItemDecorator
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

# item = Decorator::Item.new

# sword = Decorator::SwordDecorator.new(item)
# puts "You can buy #{sword.description} for #{sword.price}"

# bow = Decorator::BowDecorator.new(item)
# puts "You can buy #{bow.description} for #{bow.price}"
