# -*- encoding : utf-8 -*-

require 'represent/entity/initialize'
require 'represent/entity/to_serializable'

module Represent
  Class Entity do
    let(:attributes) do
      {
        one: attribute_one_klass,
        two: attribute_two_klass
      }
    end

    Double :attribute_one_klass
    Double :attribute_one_klass_instance

    Double :attribute_two_klass
    Double :attribute_two_klass_instance

    let(:input) do
      {
        one: one,
        two: two
      }
    end

    let(:one) { 1 }
    let(:two) { 2 }

    RespondsTo :to_serializable do
      ByReturning 'a Hash' do
        expect(attribute_one_klass)
          .to receive(:new)
          .with(one)
          .and_return(attribute_one_klass_instance)
          .ordered

        expect(attribute_two_klass)
          .to receive(:new)
          .with(two)
          .and_return(attribute_two_klass_instance)
          .ordered

        expect(attribute_one_klass_instance)
          .to receive(:to_serializable)
          .with(no_args)
          .and_return(one)

        expect(attribute_two_klass_instance)
          .to receive(:to_serializable)
          .with(no_args)
          .and_return(two)

        subject.new(attributes, input).to_serializable.must_equal(
          one: one,
          two: two
        )
      end
    end
  end
end
