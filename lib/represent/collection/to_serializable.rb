# -*- encoding : utf-8 -*-

module Represent
  class Collection
    def to_serializable
      @collection.collect &:to_serializable
    end
  end
end
