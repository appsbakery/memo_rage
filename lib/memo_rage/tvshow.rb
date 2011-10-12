module MemoRage
  class TvShow < Node
    attr_accessor :title
    
    def initialize(identifier, attributes = {})
      super
      @title  = attributes[:title]
    end
    
    def self.find(title)
      new('title/maindetails').fetch({:title => title})
    end
  end
end
