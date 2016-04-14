module Composite
  class CompositeTask
    def initialize
      @tasks = []
    end

    def add_task(task)
      @tasks << task
    end

    def amount
      @tasks.inject(0){ |sum, task| sum += task.amount }
    end
  end

  class Dough < CompositeTask
  end

  class Butter < CompositeTask
  end

  class Cake < CompositeTask
  end

  class Ingredients
    attr_reader :amount

    def initialize(amount)
      @amount = amount
    end
  end

  class FirstIngredient < Ingredients
  end

  class SecondIngredient < Ingredients
  end

  class ThirdIngredient < Ingredients
  end
end

dough = Composite::Dough.new
dough.add_task(Composite::FirstIngredient.new 500)
dough.add_task(Composite::SecondIngredient.new 300)
puts "Now we have got #{dough.amount} of dough"

butter = Composite::Butter.new
butter.add_task(Composite::SecondIngredient.new 200)
butter.add_task(Composite::ThirdIngredient.new 150)
puts "Now we have got #{butter.amount} of butter"

cake = Composite::Cake.new
cake.add_task(dough)
cake.add_task(butter)
puts "Finally our cake is ready and its big - #{cake.amount}"
