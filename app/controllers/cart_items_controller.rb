class CartItemsController < ApplicationController
  def index
    @cart_items = cart.data
  end

  def create
    session[:cart] = cart.add_item(params[:id])

    # we have a params item_id
    # with this item_id we want to create a hash where item_id => quantity
    # we want to instantiate a cart object with this item_id => quantity hash
    redirect_to root_path
  end
end
