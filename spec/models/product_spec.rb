require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    
    it 'should save successfully' do
      @product = Product.new
      @product.name = 'Thing'
      @product.price = 25
      @product.quantity = 6
      @product.category_id = 1

      expect(@product).to be_present
    end

    it 'should have an error for name' do
      @product = Product.new
      @product.name = nil
      @product.price = 25
      @product.quantity = 6
      @product.category_id = 1

      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")

    end

    it 'should have an error for price' do
      @product = Product.new
      @product.name = 'Thing'
      @product.price = nil
      @product.quantity = 6
      @product.category_id = 1

      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank")

    end

    it 'should have an error for quantity' do
      @product = Product.new
      @product.name = 'Thing'
      @product.price = 25
      @product.quantity = nil
      @product.category_id = 1

      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")

    end

    it 'should have an error for category' do
      @product = Product.new
      @product.name = 'Thing'
      @product.price = 25
      @product.quantity = 6
      @product.category_id = nil

      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")

    end

  end
end