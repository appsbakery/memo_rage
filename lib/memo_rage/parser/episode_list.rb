module MemoRage
  module Parser
    class EpisodeList < Base
      def parse_content
        @episodes = []
        doc = Nokogiri::XML(@content.body)
        doc.xpath('//Show//Episodelist//Season//episode').each do |record|
          season = record.parent.at("@no").text.to_i
          episode = Entry.new(record)
          @episodes << MemoRage::Episode.new(
            :id => episode.link.match(/[0-9]+$/).to_a.first.to_i,
            :num => episode.epnum,
            :season => season,
            :season_num => episode.seasonnum.try(:to_i),
            :prod_num => episode.prodnum,
            :airdate => episode.airdate,
            :link => episode.link,
            :title => episode.title,
            :rating => episode.rating,
            :image => episode.screencap
          )
        end
        
        MemoRage::Show.new(
          :name => doc.at('//Show//name').text,
          :seasons => doc.at('//Show//totalseasons').text.to_i,
          :episodes => @episodes
        )
      end
    end
  end
end
