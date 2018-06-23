class OrdersController < ApplicationController

  include ApplicationHelper

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items.all()
    @ordered = Product.find_by(id: @line_items)
  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
      UserMailer.welcome_email(order).deliver
      flash[:success] = "Mail sent"
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end
  

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_total, # in cents
      description: guest_if_nil,
      currency:    'cad'
    )
  end

  def guest_if_nil
    if current_user == nil
      return "Guest's Jungle Order"
    else
      return "#{current_user.name}'s Jungle Order"
    end
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_total,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )
    cart.each do |product_id, details|
      if product = Product.find_by(id: product_id)
        quantity = details['quantity'].to_i
        order.line_items.new(
          product: product,
          quantity: quantity,
          item_price: product.price,
          total_price: product.price * quantity
        )
      end
    end
    order.save!
    order
  end

  # returns total in cents not dollars (stripe uses cents as well)
  def cart_total
    total = 0
    cart.each do |product_id, details|
      if p = Product.find_by(id: product_id)
        total += p.price_cents * details['quantity'].to_i
      end
    end
    total
  end
  helper_method :cart_total
end
