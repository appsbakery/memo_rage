module MemoRage
  module Parser
    class ShowInfo < Base
      def parse_content(content)
        doc = REXML::Document.new(content.body)
        showinfo = doc.elements["Showinfo"]

        unless showinfo == "0"
          parse_entry(showinfo)
        end
      end

      def parse_entry(entry)
        MemoRage::Show.new(
          :id => entry.elements["showid"].text.to_i,
          :name => entry.elements["showname"].text,
          :link => entry.elements["showlink"].text,
          :seasons => entry.elements["seasons"].text.to_i,
          :image => entry.elements["image"].text,
          :started => entry.elements["started"].text,
          :ended => entry.elements["ended"].text,
          :origin_country => entry.elements["origin_country"].text,
          :status => entry.elements["status"].text,
          :classification => entry.elements["classification"].text,
          :genres => form_array(entry.elements["genres"]),
          :runtime => entry.elements["runtime"].text.to_i,
          :airtime => entry.elements["airtime"].text,
          :airday => entry.elements["airday"].text,
          :timezone => entry.elements["timezone"].text
        )
      end

    end
  end
end
