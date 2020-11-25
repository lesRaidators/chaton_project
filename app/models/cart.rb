class Cart < ApplicationRecord
    belongs_to :user
    has_many :lineitems


    def add_item(item)
        
        product = lineitems.find_by(item_id: item)
        
        if product
            product.quantity +=1 
        else 
            product = lineitems.new(item: item)
        end
        product
    end
end

