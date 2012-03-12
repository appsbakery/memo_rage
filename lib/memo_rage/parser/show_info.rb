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
          :id =>                parse_value(entry, "showid").to_i,
          :name =>              parse_value(entry, "showname"),
          :link =>              parse_value(entry, "showlink"),
          :seasons =>           parse_value(entry, "seasons").to_i,
          :image =>             parse_value(entry, "image"),
          :started =>           parse_value(entry, "started"),
          :ended =>             parse_value(entry, "ended"),
          :origin_country =>    parse_value(entry, "origin_country"),
          :status =>            parse_value(entry, "status"),
          :classification =>    parse_value(entry, "classification"),
          :genres =>            form_array(entry.elements["genres"]),
          :runtime =>           parse_value(entry, "runtime").to_i,
          :airtime =>           parse_value(entry, "airtime"),
          :airday =>            parse_value(entry, "airday"),
          :timezone =>          parse_value(entry, "timezone")
        )
      end

    end
  end
end
