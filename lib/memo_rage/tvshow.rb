module MemoRage
  class TvShow < Node
    attr_accessor :type, :title, :sid, :ep
    
    def initialize(identifier, attributes = {})
      super
      @type    = attributes[:type]
      @title   = attributes[:title]
      @sid     = attributes[:sid]
      @ep      = attributes[:ep]
    end
    
    def self.search(title, sid, ep)
      new('myfeeds').fetch({:type => "search", :title => title, :sid => show_id, :ep => ep})
    end
  end
end
