module Ramlstyle
  class RuleProvider
    attr_reader :raml, :rules

    def initialize(args={})
      @raml = args[:raml]
      @rules = args[:rules]
    end

    def messages
      @rules.messages
    end
  end

  require 'forwardable'
  class Rules
      extend Forwardable
      def_delegators :@rules, :raml, :each
      include Enumerable

      def initialize(rules)
        @rules = rules
      end

      def messages
        select {|rule| rule.emit_message}
      end
  end
end
