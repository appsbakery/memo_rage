module MemoRage
  module Parser
    class Base
      def initialize(content)
        @content = content
      end
      
      def parse
        parse_content
      end

      def form_array(entry)
        entry.elements.collect do |text|
          text.text
        end
      end
    end
  end
end
