module MemoRage
  module Parser
    class ShowSearch < Base
      def parse_content
        doc = Nokogiri::XML(@content.body)
        doc.xpath("//Results//show").collect do |entry|
          entry = MemoRage::Parser::Entry.new(entry)
          MemoRage::Show.new(
            :id => entry.showid.to_i,
            :name => entry.name
          )
        end
      end
    end
  end
end
