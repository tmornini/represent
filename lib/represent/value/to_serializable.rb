# -*- encoding : utf-8 -*-

require 'represent/value/initialize'

module Represent
  class Value
    def to_serializable
      @helper.to_serializable @normalized_input
    end
  end
end
