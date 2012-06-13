module MemoRage
  module Parser
    class ShowInfo < Base
      def parse_content
        result = @doc.at("Showinfo")
        return nil if result.blank? || result.text.blank?
        
        entry = MemoRage::Parser::Entry.new(result)
        show = MemoRage::Show.new(
          :id =>                entry.showid.to_i,
          :name =>              entry.showname,
          :link =>              entry.showlink,
          :seasons =>           entry.seasons.to_i,
          :image =>             entry.image,
          :started =>           entry.started,
          :ended =>             entry.ended,
          :origin_country =>    entry.origin_country,
          :status =>            entry.status,
          :classification =>    entry.classification,
          :genres =>            entry.to_array(:genres),
          :runtime =>           entry.runtime.to_i,
          :airtime =>           entry.airtime,
          :airday =>            entry.airday,
          :timezone =>          entry.timezone
        )
      end
    end
  end
end
