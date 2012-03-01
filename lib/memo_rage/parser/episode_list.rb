module MemoRage
  module Parser
    class EpisodeList < Base
      def parse_content(content)
        doc = REXML::Document.new(content.body)
        list = doc.elements["Show"]

        unless list == "0"
          parse_entry(list)
        end
      end
      
      def parse_entry(entry)
        episodes = []
        season_number = 0
        entry.elements["Episodelist"].elements.each("Season") do |season|
          season_number += 1
          season.elements.each("episode") do |episode|
            if episode.elements["screencap"] == nil
                missing = episode.add_element "screencap"
                missing.add_text ""
            end
            episodes << MemoRage::Episode.new(
              :num => episode.elements["epnum"].text,
              :season => season_number,
              :season_num => episode.elements["seasonnum"].text,
              :prod_num => episode.elements["prodnum"].text,
              :airdate => episode.elements["airdate"].text,
              :link => episode.elements["link"].text,
              :title => episode.elements["title"].text,
              :rating => episode.elements["rating"].text,
              :image => episode.elements["screencap"].text
            )
          end
        end
        MemoRage::Show.new(
          :name => entry.elements["name"].text,
          :seasons => entry.elements["totalseasons"].text.to_i,
          :episodes => episodes
        )
      end
    end
  end
end
