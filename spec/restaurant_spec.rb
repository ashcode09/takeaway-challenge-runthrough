require 'restaurant'
describe Restaurant do
  it 'can have a menu of dishes' do
    expect(subject.menu).to include 'lasagne'
  end

  it 'can order one dish from menu' do
    subject.select_dish('lasagne')
    expect(subject.basket).to eq([{'lasagne' => 10.0}])
  end

  it 'can order two of the same dish from menu' do
    subject.select_dish('lasagne',2)
    expect(subject.basket).to eq([{'lasagne' => 10.0}, {'lasagne' => 10.0}])
  end

  it 'can order two different dishes from menu' do
    subject.select_dish('lasagne',1)
    subject.select_dish('gelato',2)
    expect(subject.basket).to eq([{'lasagne' => 10.0}, {'gelato' => 18.2}, {'gelato' => 18.2}])
  end

  it 'can calculates basket total and shows customer bill' do
    subject.select_dish('pizza', 2)
    expect(subject.bill_total).to eq(23)
  end

end