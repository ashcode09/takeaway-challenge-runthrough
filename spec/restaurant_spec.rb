require 'restaurant'
describe Restaurant do
  it 'can have a menu of dishes' do
    expect(subject.menu).to include 'lasagne'
  end

end