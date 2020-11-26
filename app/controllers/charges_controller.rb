require 'pry'
class ChargesController < ApplicationController
  def new
  end
  
  def create
    @cart = current_user.cart
    @amount = (@cart.total * 100).to_i

  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
   
    if customer.save && charge.save
    @order = Order.create(stripe_customer_id: customer.id, user_id: current_user.id)

     @cart.lineitems.destroy_all
      redirect_to root_path
    else
     render 'new'
  end

    @order_items = @cart.lineitems.each do |item|
    @order_form =OrderForm.create(order_id: @order.id, item_id: item.id)
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
