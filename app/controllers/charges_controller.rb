class ChargesController < ApplicationController
  def new
    @cart = Cart.find(params[:cart_id])
    @price = @item.total
    @amount = @price * 100
  end
  
  def create
    @cart = Cart.find(params[:cart_id])
    @price = @cart.total
    @amount = @price * 100

    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
  
    if customer.save && charge.save
      order  = Order.create(user_id: current_user.id, item_id: @charge.id, stripe_customer_id: customer.id)
        redirect_to root_path
      else
        render 'new'
      end
  

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
