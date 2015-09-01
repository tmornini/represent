# -*- encoding : utf-8 -*-

# rubocop:disable MethodName

require 'singleton'

gem 'minitest'

require 'minitest/spec'

require 'minitest/pride' unless ENV['SUBLEDGER_ENV'] == 'ci'

require 'minitest/autorun'

MiniTest::Test.parallelize_me!

module Kernel
  def Class thing, &block
    describe_set_subject thing, &block
  end

  def Constant thing, &block
    describe_set_subject thing, &block
  end

  def Module thing, &block
    describe_set_subject thing, &block
  end

  def Instance &block
    describe 'instance', &block
  end

  def RespondsTo desc, &block
    describe "responds to #{desc}", &block
  end

  def When desc, &block
    describe "when #{desc}", &block
  end

  def And desc, &block
    describe "and #{desc}", &block
  end

  def Double name
    let(name) { double name }
  end

  private

  # Thanks Anton Lindqvist!
  # https://github.com/mptre/minitest-implicit-subject

  def describe_set_subject *args, &block
    cls = describe *args, &block

    subject = args.first

    if subject.respond_to?(:included_modules) &&
       Array(subject.included_modules).include?(Singleton)

      subject = subject.instance
    end

    cls.subject { subject }

    cls
  end
end

module MiniTest
  class Spec
    def self.It desc, &block
      it "by raising #{desc}", &block
    end

    def self.By desc, &block
      it "by raising #{desc}", &block
    end

    def self.ByRaising desc, &block
      it "by raising #{desc}", &block
    end

    def self.ByReturning desc, &block
      it "by returning #{desc}", &block
    end

    def self.ByYielding desc, &block
      it "by yielding #{desc}", &block
    end
  end
end
