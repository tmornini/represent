# -*- encoding : utf-8 -*-

module Represent
  class Entity
    def initialize attributes, input
      @attributes =
        attributes.each_with_object({ }) do |(key, value_klass), memo|
          memo[key] = value_klass.new input[key]
        end
    end
  end
end
