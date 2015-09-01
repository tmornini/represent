# -*- encoding : utf-8 -*-

require 'represent/entity/initialize'

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

    RespondsTo :new do
      ByReturning 'a new Entity' do
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

        subject.new(attributes, input).must_be_instance_of Entity
      end
    end
  end
end
