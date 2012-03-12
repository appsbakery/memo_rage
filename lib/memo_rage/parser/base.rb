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
        entry.elements.collect do |text|
          text.text
        end
      end

      def parse_value(element, key)
        element.elements.map { |e| e.has_name?(key) }.include?(true) ? element.elements[key].text : ""
      end
    end
  end
end
