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

  scenario 'restuarant calculates basket total and shows customer bill' do
    restaurant.select_dish('pizza', 2)
    expect(restaurant.bill_total).to eq(23)
  end

  scenario 'restaurant presents a receipt to customer' do
    restaurant.select_dish('pizza', 2)
    restaurant.bill_total
    expect(restaurant.receipt).to eq [{"pizza" => 11.5}, {"pizza" => 11.5}, "Total amount = £23.0"]
  end

  # scenario 'restaurant can send a text to customer to confirm order' do
  #   twilio = double :twilio
  #   allow(twilio).to receive(:send_text).with(any_args)
  #   restaurant.select_dish('pizza', 2)
  #   restaurant.receipt
  #   expect(twilio).to respond_with("Thank you! Your order was placed and will be delivered before #{(Time.now + (60*60)).asctime}")
  # end

end