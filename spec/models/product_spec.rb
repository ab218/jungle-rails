require 'rails_helper'


RSpec.describe Product, type: :model do
  subject { Product.new name: "Anything", price: 123, quantity: 123}

before(:each) do
@category = Category.create(name: 'aa')
@product = Product.create!(
  name: "Anything",
  price: 123,
  quantity: 123,
  category: @category
)
end

  context "Relationships:" do 
  it "should belong to a category" do
    expect(@product.category).to eq(@category)
    end
  end
  
  it "is valid with valid attributes" do
    subject.name = "Anything"
    subject.price = 123
    subject.quantity = 123
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.name = "Anything"
    expect(subject).to_not be_valid
  end

  it "is not valid without a quantity" do
    subject.name = "Anything"
    subject.price = 123
    expect(subject).to_not be_valid
  end


context "Relationships:" do 
    
  it { is_expected.to belong_to(:category) }

end

end

