# -*- encoding : utf-8 -*-

require 'represent/value/initialize'

module Represent
  class Value
    def initialize helper, input
      @normalized_input = helper.normalize input

      helper.validate @normalized_input

      @helper = helper
    end
  end
end
