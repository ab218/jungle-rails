require 'rails_helper'


RSpec.describe Product, type: :model do
  # subject { Product.new name: "Anything", price: 123, quantity: 123}

before(:each) do
@category = Category.create(name: 'aa')
@product = @category.products.create!(
  name: "Anything",
  price: 123,
  quantity: 123
)
end


  context "Relationships:" do 
    it "should belong to a category" do
      expect(@product.category).to eq(@category)
    end
  end
  
  it "is valid with valid attributes" do
    expect(@product).to be_valid
  end

  it "is not valid without a name" do
    @product.name = nil
    expect(@product).to_not be_valid
  end

  it "is not valid without a price" do
    product = @category.products.create(
      name: 'Anything',
      quantity: 123
    )
    expect(product).to_not be_valid
  end

  it "is not valid without a quantity" do
    @product.quantity = nil
    expect(@product).to_not be_valid
  end


context "Relationships:" do 
    
  it { is_expected.to belong_to(:category) }

end

end

