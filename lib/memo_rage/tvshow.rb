module MemoRage
  class TvShow < Node
    attr_accessor :show
    def initialize(identifier, attributes = {})
      super
      @show  = attributes[:show]
    end
    
    def self.find(title)
      new('search.php').fetch({:show => title})
    end
  end
end
