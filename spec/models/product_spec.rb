require 'rails_helper'

describe Product do
  it { should have_many :reviews }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should validate_presence_of :quantity }
  it { should validate_presence_of :author }

  describe '.alphabetical' do
    it "returns products in alphabetical order by name" do
      p1 = FactoryBot.create(:product, name: "You and Your Bantha")
      p2 = FactoryBot.create(:product, name: "Dapper and Dead")
      p3 = FactoryBot.create(:product, name: "Protocol: a Love Story")
      expect(Product.alphabetical).to eq([p2,p3,p1])
    end
  end

  describe '#low_stock?' do
    it "returns true if a book has 10 or less copies in stock" do
      product = FactoryBot.create(:product, quantity: 10)
      expect(product.low_stock?).to eq(true)
    end

    it "returns false if a book has more than 10 copies in stock" do
      product = FactoryBot.create(:product, quantity: 15)
      expect(product.low_stock?).to eq(false)
    end
  end

  describe '.featured' do
    it "returns all featured products" do
      p1 = FactoryBot.create(:product, featured: true)
      p2 = FactoryBot.create(:product)
      p3 = FactoryBot.create(:product, featured: true)
      expect(Product.featured).to eq([p1,p3])
    end
  end

  describe '#has_discount?' do
    it "returns true if book is discounted at current time" do
      p1 = FactoryBot.create(:product, discount: 10, discount_end: Date.today)
      expect(p1.has_discount?).to eq(true)
    end

    it "returns false if book is not discounted at current time" do
      p1 = FactoryBot.create(:product)
      expect(p1.has_discount?).to eq(nil)
    end
  end
end
