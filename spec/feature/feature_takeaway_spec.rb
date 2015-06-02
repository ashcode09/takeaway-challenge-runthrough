require 'capybara/rspec'
require 'restaurant'
require 'customer'

feature 'Takeaway' do

  let(:restaurant) {Restaurant.new}
  let(:customer)   {Customer.new}

  scenario 'display menu with prices' do
    expect(restaurant.menu).to include 'yoghurt'
  end

  scenario 'customer can select dishes from menu' do
    restaurant.select_dish('lasagne')
    expect(restaurant.basket).to eq([{'lasagne' => 10.0}])
  end

end