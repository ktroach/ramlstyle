require 'ostruct'

module RuleFactory
  def self.build(config, rules_class = Rules.new)
    rules_class.new(
      config.collect {|rule_config|
          create_rule(rule_config)})
  end

  def self.create_rule(rule_config)
    OpenStruct.new(
      type:  rule_config[0],
      description: rule_config[1],
      emit_message: rule_config.fetch(2, true)
    )
  end


end
