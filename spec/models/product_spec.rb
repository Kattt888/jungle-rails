require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'saves successfully when all four fields are set' do
      category = Category.new(name: 'Test Category')
      product = Product.new(name: 'Test Product', price_cents: 1000, quantity: 10, category: category)
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      category = Category.new(name: 'Test Category')
      product = Product.new(name: nil, price_cents: 1000, quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is invalid without a price' do
      category = Category.new(name: 'Test Category')
      product = Product.new(name: 'Test Product', price: nil, quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price cents must be greater than 0")
    end

    it 'is invalid without a quantity' do
      category = Category.new(name: 'Test Category')
      product = Product.new(name: 'Test Product', price_cents: 1000, quantity: nil, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid without a category' do
      product = Product.new(name: 'Test Product', price_cents: 1000, quantity: 10, category: nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
