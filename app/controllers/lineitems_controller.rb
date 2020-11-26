require 'pry'
class LineitemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def index
    
  end

  def create
  
    item = Item.find(params[:item_id])
    @lineitem = @cart.add_item(item)
   
    
    respond_to do |format|
      if @lineitem.save 
        format.html {redirect_to @lineitem.cart, notice: 'Line item was successfully created.'}
      else 
        format.html {render :new}
      end
    end
  end

  def show
  end

  def destroy
    @lineitem = Lineitem.find(params[:id])
    @lineitem.destroy
    redirect_to @lineitem.cart
  end

  private 

  def set_lineitem
   @lineitem = Lineitem.find(params[:id])
  end

  def lineitem_params
    params.require(:lineitem).permit(:cart_id, :item_id, :quantity)
  end
end