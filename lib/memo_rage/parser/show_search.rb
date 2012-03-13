module MemoRage
  module Parser
    class ShowSearch < Base
      def parse_content(content)
        doc = REXML::Document.new(content.body)
        results = doc.elements["Results"]

        shows = []
        unless results == "0"
          results.elements.each("show") do |show|
            shows << parse_entry(show)
          end
        end
        
        shows
      end
      
      def parse_entry(entry)
        entry = MemoRage::Parser::Entry.new(entry)
        MemoRage::Show.new(
          :id => entry.showid.to_i,
          :name => entry.name
        )
      end
    end
  end
end
