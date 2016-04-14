module Adapter
  class User
    attr_accessor :pay, :taxes

    def initialize
      @pay = 0
      @taxes = []
    end

    def add_tax(tax)
      @taxes << (tax.user = self)
    end

    def pay_tax(tax)
      tax.calculate
      @taxes.delete tax
    end
  end

  class Tax
    attr_accessor :total, :user

    def initialize(total)
      @total = total
    end

    def calculate
      @user.pay += @total * 20 / 100
    end
  end

  class OldTax
    attr_accessor :total, :rate

    def initialize
      @total = 500
      @rate = 0.25
    end

    def done
      total * rate
    end
  end

  class TaxAdapter
    attr_accessor :user

    def initialize(tax, total)
      @tax = tax
      @tax.total = total
    end

    def calculate
      @user.pay += @tax.done
    end
  end
end

user = Adapter::User.new
tax = Adapter::Tax.new 500

user.add_tax(tax)
user.pay_tax(tax)
puts user.pay

old_tax_adapted = Adapter::TaxAdapter.new(Adapter::OldTax.new, 500)
user.add_tax(old_tax_adapted)
user.pay_tax(old_tax_adapted)
puts user.pay
