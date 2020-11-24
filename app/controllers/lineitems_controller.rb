require 'pry'
class LineitemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only[:create]

  def index
    
  end

  def create
    binding.pry 
    item = Item.find(params[:items_id])
    @lineitem = @cart.lineitem.create(item)

    redirect_to @lineitem.cart, notice: 'Line item was successfully created.'
  end

  def show
  end

  private 

  def set_lineitem
   @lineitem = Lineitem.find(params[:id])
  end

  def lineitem_params
    params.require(:lineitem).permit(:cart_id, :item_id, :quantity)
  end
end