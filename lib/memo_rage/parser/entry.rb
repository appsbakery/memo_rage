module MemoRage
  module Parser
    class Entry
      def initialize(entry)
        @entry = entry
      end
      
      def method_missing(sym, *args)
        @entry.elements.map { |e| e.has_name?(sym.to_s) }.include?(true) ? @entry.elements[sym.to_s].text : ""
      end
      
      def to_array(name)
        @entry.elements[name.to_s].elements.collect do |text|
          text.text
        end
      end
    end
  end
end
