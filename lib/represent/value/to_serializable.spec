# -*- encoding : utf-8 -*-

require 'represent/value/initialize'
require 'represent/value/to_serializable'

module Represent
  Class Value do
    Double :helper

    RespondsTo :to_serializable do
      ByReturning 'a Hash value (leaf)' do
        expect(helper)
          .to receive(:normalize)
          .with(:input)
          .and_return(:normalized_input)

        expect(helper)
          .to receive(:validate)
          .with(:normalized_input)

        expect(helper)
          .to receive(:to_serializable)
          .with(:normalized_input)
          .and_return(:serializable_input)

        subject.new(helper, :input).to_serializable.must_equal(
          :serializable_input
        )
      end
    end
  end
end
