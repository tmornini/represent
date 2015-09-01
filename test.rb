#!/usr/bin/env ruby

require 'json'

$LOAD_PATH.unshift 'lib'

require 'represent'

module AliceNumber
  def self.new input
    Represent::Value.new self, input
  end

  def self.validate input
    fail "#{input.inspect} must be Fixnum" unless input.class == Fixnum
  end

  def self.normalize input
    input
  end

  def self.to_serializable input
    format '%x', input
  end
end

module Alice
  def self.new input
    Represent::Collection.new AliceNumber, input
  end
end

module TedString
  def self.new input
    Represent::Value.new self, input
  end

  def self.validate input
    fail "#{input.inspect} must be String" unless input.class == String
  end

  def self.normalize input
    input
  end

  def self.to_serializable input
    input
  end
end

module Ted
  def self.new input
    Represent::Entity.new(
      {
        name: TedString
      },
      input
    )
  end
end

module Bob
  def self.new input
    Represent::Entity.new(
      {
        alice:  Alice,      # collection
        ted:    Ted,        # entity
        number: AliceNumber # value
      },
      input
    )
  end
end

bob =
  Bob.new alice:  [ 1, 2, 3 ],
          ted:    {
            name: 'Ted'
          },
          number: 171

puts JSON.generate(bob.to_serializable)
