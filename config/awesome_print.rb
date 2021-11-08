module AwesomePrint
  module Formatters
    class BaseFormatter
      def indented(&block)
        inspector.increase_indentation(&block)
      end
    end
  end

  class Inspector
    def increase_indentation(&block)
      indentator.indent(&block)
    end
  end
end