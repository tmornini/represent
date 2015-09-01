# -*- encoding : utf-8 -*-

require 'represent/collection/initialize'

module Represent
  Class Collection do
    let(:input) do
      [
        {
          one: one
        }
      ]
    end

    let(:one) { 1 }

    Double :entity_klass

    Double :entity_one

    RespondsTo :new do
      ByReturning 'a new Collection' do
        expect(entity_klass)
          .to receive(:new)
          .with(one: 1)
          .and_return(:entity_klass_instance)

        subject.new(entity_klass, input).must_be_instance_of Collection
      end
    end
  end
end
