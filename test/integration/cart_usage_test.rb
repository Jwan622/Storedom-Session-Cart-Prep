require 'test_helper'

class CartUsageTest < ActionDispatch::IntegrationTest

  test "there is an Add to Cart button" do
    items = 10.times { |i| Item.create(name: "item#{i}", description: "item description #{i}")}

    visit root_path

    within first(".item-listing") do
      assert page.has_button?("Add to Cart")
    end
  end

  test "user can add an item to the cart" do
    10.times { |i| Item.create(name: "item#{i}", description: "item description #{i}")}

    visit root_path

    within first(".item-listing") do
      click_button("Add to Cart")
    end

    within(".cart") do
      click_link("View My Cart")
    end

    assert page.has_content?(Item.first.name)
    assert page.has_content?(1)
    assert page.has_content?(Item.first.description)
  end

  test "user can update the quantity of an item in the cart" do
    Item.create(name: "stuff", description: "stuffity stuff")

    visit items_path

    click_button("Add to Cart")
    click_button("Add to Cart")

    within(".cart") do
      click_link("View My Cart")
    end

    assert page.has_content?(Item.first.name)
    assert page.has_content?(2)
  end

  test "user can delete the item in the cart" do
    item = Item.create(name: "stuff", description: "stuffity stuff")

    visit root_path


  end
end
