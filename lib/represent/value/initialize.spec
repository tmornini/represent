# -*- encoding : utf-8 -*-

require 'represent/value/initialize'

module Represent
  Class Value do
    Double :helper

    RespondsTo :new do
      ByReturning 'a new Value' do
        expect(helper)
          .to receive(:normalize)
          .with(:input)
          .and_return(:normalized_input)

        expect(helper)
          .to receive(:validate)
          .with(:normalized_input)

        subject.new(helper, :input).must_be_instance_of Value
      end
    end
  end
end
