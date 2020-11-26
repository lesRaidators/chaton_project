require 'pry'
class OrderMailer < ApplicationMailer
  default from: 'kingcat@yopmail.com'

  def new_order_email (order)

    @order = order


    mail(to: 'kingcat@yopmail.com', subject: "You got a new order!")

  end 

  def order_email (order)
    @order = order
    @cart = @order.user.cart
    @user = User.find(order.user_id)
    @url  = 'https://project-chaton-development.herokuapp.com/'
    mail(to: @user.email, subject: 'Vos achats chez Catoon !')
  end


end