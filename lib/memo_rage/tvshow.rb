module MemoRage
  class TvShow < Node
    attr_accessor :tconst, :title, :year
    
    def initialize(identifier, attributes = {})
      super
      @tconst = attributes[:tconst]
      @title  = attributes[:title]
      @year   = attributes[:year]
    end
    
    def self.find(tconst)
      new('title/maindetails').fetch({:tconst => tconst})
    end
  end
end
