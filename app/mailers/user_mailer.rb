class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
 
    def welcome_email(order)
     @order = order
      @url  = 'jungle.com'
      mail(to: order.email, subject: "Order #:#{order.id}. Thank you for your purchase!")
    end
end
