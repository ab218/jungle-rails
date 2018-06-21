# class SignupController < ApplicationController  
#   def new
#   end

#   def create
#     @account = User.new(account_params)

#     if @account.save
#       cookies.signed[:account_id] = @account.id
#       redirect_to dashboard_url
#     else
#       render :new
#     end
#   end

#   private

#   def account_params
#     params.require(:account).permit(:email, :password)
#   end
# end  