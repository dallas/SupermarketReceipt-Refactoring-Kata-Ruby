# frozen_string_literal: true

ReceiptItem = Struct.new(:product, :quantity, :price, :total_price) do
  undef :product=, :quantity=, :price=, :total_price=
end
