module MemoRage
  module Parser
    class Entry
      def initialize(entry)
        @entry = entry
      end
      
      def method_missing(sym, *args)
        @entry.at(sym.to_s).try(:text)
      end
      
      def to_array(name)
        return [] unless record = @entry.at(name.to_s)
        record.elements.map(&:text)
      end
    end
  end
end
