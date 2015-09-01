# -*- encoding : utf-8 -*-

module Represent
  class Collection
    def initialize entity_klass, input
      @collection =
        input.collect do |entity_input|
          entity_klass.new entity_input
        end
    end
  end
end
