# -*- encoding : utf-8 -*-

require 'represent/collection/initialize'
require 'represent/collection/to_serializable'

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
    Double :entity_klass_instance

    Double :entity_one

    RespondsTo :new do
      ByReturning 'a new Collection' do
        expect(entity_klass)
          .to receive(:new)
          .with(one: 1)
          .and_return(entity_klass_instance)

        expect(entity_klass_instance)
          .to receive(:to_serializable)
          .with(no_args)
          .and_return(:entity_hash)

        subject.new(entity_klass, input).to_serializable.must_equal(
          [
            :entity_hash
          ]
        )
      end
    end
  end
end
