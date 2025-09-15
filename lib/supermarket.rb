# frozen_string_literal: true

module Supermarket; end

require_relative './receipt_printer'

pattern = File.join(File.dirname(__FILE__), 'models', '*.rb')
Dir[pattern].each { |filepath| require_relative filepath }
