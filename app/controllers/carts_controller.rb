
class CartsController < ApplicationController

    def show 
        @cart = Cart.find(params[:id])     
    end

    def destroy
        @carts = Cart.find(params[:id])
        @carts.destroy
      end

end
