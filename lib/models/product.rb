# frozen_string_literal: true

Product = Struct.new(:name, :unit) do
  undef :name=, :unit=
end
