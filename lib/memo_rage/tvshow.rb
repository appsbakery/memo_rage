module MemoRage
  class TvShow
    # creation of a new object this is called after we call .new    
    def initialize(type, attributes = {})
      HTTPClient.get build_uri(type, attributes)
    end
    
    # the tv-rage api is in format ROOT_URL/myfeeds/:type.php?key=DEFAULT_PARAMS[:key]&params=value
    # yeah i know... but we need to build a proper url from the given params
    def build_uri(type, attributes)
      base_url = #{ROOT_URL}#{type} + ".php?key=" + #{DEFAULT_PARAMS[:key]}
      return y << #{base_url} + "&" + #{attributes.to_params}
    end
    
    def self.search(title)
      result = new('search', title)
      parse_response = Hash.from_xml(result.body)
      parse_response = Hashie::Mash.new(parse_response)
    end
  end
end
