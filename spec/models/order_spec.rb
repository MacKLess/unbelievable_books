require 'rails_helper'

describe Order do
  it { should belong_to :account }
  it { should validate_presence_of :account }
  it { should validate_presence_of :price_total }
  it { should validate_presence_of :status }

  describe '#add_total' do
    it "returns the total cost of items in an order" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      order = Order.find(order.id)
      expect(order.add_total).to eq (75)
    end
  end

  describe '#update_total' do
    it "sets the total cost of an order" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      order = Order.find(order.id)
      order.update_total
      expect(order.price_total).to eq (75)
    end
  end

  describe '#book_count' do
    it "returns the quantity of books in an order" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      order = Order.find(order.id)
      expect(order.book_count).to eq (5)
    end
  end

  describe '#remove_items' do
    it "removes all associated order items when order is deleted" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      item2 = FactoryBot.create(:order_item, order: order)
      order.destroy
      expect(OrderItem.all).to eq([])
    end
  end

  describe '#confirm_items' do
    it "return true if sufficient quantities of a book are available when purchased" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      expect(order.confirm_items).to eq(true)
    end

    it "returns false for purchase of books for which there are insufficient quantities" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      item.product.update(quantity: 0)
      expect(order.confirm_items).to eq(false) 
    end
  end

end
