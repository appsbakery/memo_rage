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

        if entry.elements["Episodelist"]
          entry.elements["Episodelist"].elements.each("Season") do |season|
            season.elements.each("episode") do |episode|
              episode = MemoRage::Parser::Entry.new(episode)
              episodes << MemoRage::Episode.new(
                :num => episode.epnum,
                :season => season.attributes["no"].to_i,
                :season_num => episode.seasonnum,
                :prod_num => episode.prodnum,
                :airdate => episode.airdate,
                :link => episode.link,
                :title => episode.title,
                :rating => episode.rating,
                :image => episode.screencap
              )
            end
          end
        end
        
        entry = MemoRage::Parser::Entry.new(entry)
        MemoRage::Show.new(
          :name => entry.name,
          :seasons => entry.totalseasons.to_i,
          :episodes => episodes
        )
      end
    end
  end
end
