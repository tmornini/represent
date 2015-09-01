# -*- encoding : utf-8 -*-

require 'represent'

describe 'file represent.rb' do
  When 'it is required' do
    It 'includes collection, entity and value' do
      Represent::Collection.wont_be_nil
      Represent::Entity.wont_be_nil
      Represent::Value.wont_be_nil
    end
  end
end
