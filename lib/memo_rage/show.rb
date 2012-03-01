module MemoRage
  class Show < Node
    attr_reader :id
    attr_reader :name
    attr_reader :link
    attr_reader :seasons
    attr_reader :image
    attr_reader :started
    attr_reader :ended
    attr_reader :startdate
    attr_reader :origin_country
    attr_reader :status
    attr_reader :classification
    attr_reader :runtime
    attr_reader :airtime
    attr_reader :airday
    attr_reader :timezone
    attr_reader :seasons
    
    attr_reader :genres # Array
    attr_reader :akas # Array
    attr_reader :episodes # Array
  end
end
