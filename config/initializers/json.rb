# adding for rails 6 compatibility -> remove when upgrading to rails 7
# There's an issue with parsing JSON: json (1.8.6) lib/json/common.rb:155:in parse'`

module JSON
    module_function
  
    def parse(source, opts = {})
      Parser.new(source, **opts).parse
    end
  end