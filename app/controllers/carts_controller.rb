class CartsController < ApplicationController

    def show 
        @carts = Cart.find(params[id])     
    end
end
