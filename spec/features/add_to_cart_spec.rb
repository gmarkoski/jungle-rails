require 'rails_helper'

RSpec.feature "Visitor navigates to the product page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Users can add a product to the cart" do 
    #ACT
    visit root_path

    first('article button.btn-primary').click

    #DEBUG / VERIFY
    save_screenshot

    expect(page).to have_selector('a', text: 'My Cart (1)')
  end
end