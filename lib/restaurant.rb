class Restaurant

  attr_accessor  :basket, :bill, :receipt
  attr_reader  :menu

  def initialize
     @menu = { "lasagne" => 10.00,
               "yoghurt" => 5.00,
               "panini" => 5.00,
               "pizza" => 11.50,
               "prosecco" => 22.50,
               "gelato" => 18.20
            }
      @basket = []
      @bill = []
      @receipt = 0
  end

  def select_dish(dish, quantity=1)
    quantity.times do
      basket << menu.select {|key| key == dish }
    end
  end

  def bill_total
    bill = basket.map { |x| x.values }.flatten.inject(:+)
  end

  def receipt
    basket << "Total amount = £#{bill_total}"
    return basket
  end

end

