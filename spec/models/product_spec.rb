require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should validate" do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: "Thing", price: 25, quantity: 6, category: @category)
      expect(@product). to be_present
    end

    it "should not validate cause there's no name" do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: nil, price: 25, quantity: 6, category: @category)
      @product.errors.full_messages
    end

    it "should not validate cause there's no price" do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: "Thing", price: nil, quantity: 6, category: @category)
      @product.errors.full_messages
    end

    it "should not validate cause there's no quantity" do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: "Thing", price: 25, quantity: nil, category: @category)
      @product.errors.full_messages
    end

    it "should not validate cause there's no category" do
      @product = Product.new(name: "goodName", price: 25, quantity: 6, category: nil)
      @product.errors.full_messages
    end

  end
end 