require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  i = 0
  while i < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
    couponed_item_name = "#{coupons[i][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)

    if cart_item && cart_item[:count] >= coupons[i][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[i][:num]
        cart_item[:count] -= coupons[i][:num]
      else 
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[i][:cost] / coupons[i][:num],
          :count => coupons[i][:num],
          :clearance => cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item [:count] -= coupons[i][:num]
      end
    end
    i += 1
  end 
  cart
end







def apply_clearance(cart)
  i = 0
  while i < cart.length
    if cart[i][:clearance] == true
      cart[i][:price] = (cart[i][:price] - (cart[i][:price] * 0.20)).round(2)
    end
    i += 1
  end
  cart
end






def checkout(cart, coupons)
 consolidated_cart = consolidate_cart(cart)
 couponed_cart = apply_coupons(consolidate_cart, coupons)
 final_cart = apply_coupons(couponed_cart)
 
 total_price = 0
 
 i = 0
 while i < final_cart.length
  total += 
  i += 1
 end
end







