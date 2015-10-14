module Ramlstyle
  class RuleProducer
    def initialize(raml)
      root_config = [['error', 'API Version (version) is required']]
      produce_rules(raml, root_config)
    end
    def produce_rules(raml, root_config)
      root_rule = RuleProvider.new(raml, rules: RuleFactory.build(root_config))
      puts root.messages
    end
  end
end
