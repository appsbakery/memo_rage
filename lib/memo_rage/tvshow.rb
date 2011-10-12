module MemoRage
  class TvShow < Node
    attr_accessor :title
    
    def initialize(identifier, attributes = {})
      super
      @title  = attributes[:title]
    end
    
    def self.find(tconst)
      new('title/maindetails').fetch({:tconst => tconst})
    end
  end
end
