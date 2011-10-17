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
        MemoRage::Show.new(
          :id => entry.elements["showid"].text.to_i,
          :name => entry.elements["name"].text
        )
      end
    end
  end
end