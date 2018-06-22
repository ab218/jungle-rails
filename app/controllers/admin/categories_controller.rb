class Admin::CategoriesController < ApplicationController

  include HttpAuthConcern
  
    def index
      @categories = Category.order(id: :desc).all
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
  
      if @category.save
        redirect_to [:admin, :categories], notice: 'Category created!'
      else
        render :new
      end
    end
  
    def destroy
      @category = Category.find params[:id]
      @category.destroy
      redirect_to [:admin, :categories], notice: 'Category deleted!'
    end
  
    private
  
    def category_params
      params.require(:category).permit(
        :name
      )
    end

    def check_admin
      if current_user.admin == false
        redirect '/'
      end
      # add before_action :check_admin to top of this page
    end
  
  end
  