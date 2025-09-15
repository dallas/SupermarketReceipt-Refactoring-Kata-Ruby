# frozen_string_literal: true

require_relative './test_helper'

RSpec.describe 'Supermarket Receipt' do
  it 'can add a 10% discount special offer on a toothbrush' do
    catalog = FakeCatalog.new
    toothbrush = Product.new('toothbrush', ProductUnit::EACH)
    catalog.add_product(toothbrush, 0.99)

    apples = Product.new('apples', ProductUnit::POUND)
    catalog.add_product(apples, 1.99)

    cart = ShoppingCart.new
    cart.add_item_quantity(apples, 2.5)

    teller = Teller.new(catalog)
    teller.add_special_offer(SpecialOfferType::TEN_PERCENT_DISCOUNT, toothbrush, 10.0)

    receipt = teller.checks_out_articles_from(cart)

    expect(receipt.total_price).to be_within(0.01).of(4.975)
  end
end
