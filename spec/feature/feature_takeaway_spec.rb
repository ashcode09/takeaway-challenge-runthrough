require 'capybara/rspec'
require 'restaurant'

feature 'Takeaway' do

  scenario 'display menu with prices' do
    restaurant = Restaurant.new
    expect(restaurant.menu).to include 'yoghurt'
  end

end