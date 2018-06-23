class ReviewsController < ApplicationController

    before_action :require_login
 
   
    def create
        @reviewy = Review.new(form_params)
        @reviewy.product_id = params[:product_id]
        @reviewy.user_id = current_user.id
        if @reviewy.save
            redirect_to :back
        else
            redirect_to :back
        end
      end

      def destroy
        Review.find(params[:id]).destroy
        redirect_to :back
      end

  private

  def form_params
    params.require(:review).permit(:rating, :description)
  end


end
