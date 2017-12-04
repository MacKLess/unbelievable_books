class Order < ActiveRecord::Base
  belongs_to :account
  has_many :order_items
  validates_presence_of :account, :price_total, :status
  before_save :update_total

  def add_total
    OrderItem.where(order: self).collect { |item| item.reserved_price * item.quantity }.sum
  end

  def update_total
    self.price_total = self.add_total
  end

  def book_count
    self.order_items.collect { |item| item.quantity }.sum
  end
end
