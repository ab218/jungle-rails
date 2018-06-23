class ReviewsController < ApplicationController

    def show
        @newreview = Review.new
    end

    def create
        @reviewy = Review.new(form_params)
        @reviewy.product_id = params[:product_id]
        @reviewy.user_id = current_user.id
        if @reviewy.save
            redirect_to products_path
        end
      end

  private

  def form_params
    params.require(:review).permit(:rating, :description)
  end
end
