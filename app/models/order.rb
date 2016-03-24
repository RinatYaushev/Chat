class Order < ActiveRecord::Base
  has_many :purchases

  belongs_to :user, counter_cache: true
end
