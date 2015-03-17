require 'test_helper'

class CartTest < ActiveSupport::TestCase

  def test_the_cart_can_create_with_item_id
    item1 = Item.create(name: "Item1")
    session = { item1.id => 2 }
    cart = Cart.new(session)
    cart_data_result = { item1 => 2 }

    assert_equal cart_data_result, cart.data
  end

  def test_the_quantity_can_be_increased
    item1 = Item.create(name: "Item1")
    session = { item1.id => 3 }
    cart = Cart.new(session)
    cart.add_item(item1.id)
    cart_data_result = { item1 => 4}

    assert_equal cart_data_result, cart.data
  end

  
end
