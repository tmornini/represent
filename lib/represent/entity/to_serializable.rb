# -*- encoding : utf-8 -*-

require 'represent/entity/initialize'

module Represent
  class Entity
    def to_serializable
      @attributes.each_with_object({ }) do |(key, value), memo|
        memo[key] = value.to_serializable
      end
    end
  end
end
