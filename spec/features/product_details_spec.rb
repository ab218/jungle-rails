require 'rails_helper'


RSpec.feature "ProductDetails", type: :feature, js: true do


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
        first('article.product').find_link('Details').click
        sleep 1
        puts page.html


    
        # DEBUG / VERIFY
        save_screenshot
    
        #VERIFY
        expect(page).to have_content "Description"
        expect(page).to have_content "Name"
        expect(page).to have_content "Quantity"
        expect(page).to have_content "Price"
        expect(page).to have_css('section.products-show')
        expect(page).to have_css('header.page-header')
        expect(page).to have_css('article.product-detail')
      end


    end