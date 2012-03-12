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
            episodes << MemoRage::Episode.new(
              :num => parse_value(episode, "epnum"),
              :season => season_number,
              :season_num => parse_value(episode, "seasonnum"),
              :prod_num => parse_value(episode, "prodnum"),
              :airdate => parse_value(episode,"airdate"),
              :link => parse_value(episode,"link"),
              :title => parse_value(episode,"title"),
              :rating => parse_value(episode,"rating"),
              :image => parse_value(episode,"screencap")
            )
          end
        end
        MemoRage::Show.new(
          :name => parse_value(entry, "name"),
          :seasons => parse_value(entry, "totalseasons").to_i,
          :episodes => episodes
        )
      end
    end
  end
end
