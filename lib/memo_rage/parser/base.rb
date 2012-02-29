module MemoRage
  module Parser
    class Base
      def initialize(content)
        @content = content
      end
      
      def parse
        parse_content @content
      end

      def form_array(entry)
        output = []
        entry.elements.each do |text|
            output << text.text
        end
        output
      end
    end
  end
end
