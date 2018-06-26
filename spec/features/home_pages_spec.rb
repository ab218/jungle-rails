require 'rails_helper'


RSpec.feature "Visitor navigates to home page", type: :feature, js: :poltergeist do

  def open_asset(file_name)
    File.open(Rails.root.join('db', 'seed_assets', file_name))
  end
  
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      end


  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot

    #VERIFY
    expect(page).to have_css 'article.product'
    expect(page).to have_css 'article.product', count: 10

  end

  
end