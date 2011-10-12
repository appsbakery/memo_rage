module MemoRage
  class Node
    attr_accessor :identifier, :endpoint

    def initialize(identifier, options = {})
      parts = [ROOT_URL, identifier.to_s]
      @identifier = identifier
      @endpoint = File.join(parts)
    end
    
    def fetch(options = {})
      fetched = get(options)[:data]
      self.class.new(@identifier, fetched)
    end
    
    protected
    def get(params = {})
      handle_response do
        HTTPClient.get @endpoint, build_params(params)
      end
    end
    
    private
    def build_params(type, title, sid, ep)
      DEFAULT_PARAMS.merge(:type => type + ".php?key=".to_s).merge(:apiKey).merge(:title => "&show=" + title.to_s).merge(:show_id => "&sid=" + show_id.to_s).merge(:ep => "&ep=" + ep.to_s)
    end
    
    def handle_response
      response = yield
      case response.body
      when 'true'
        true
      when 'false'
        raise NotFound.new('Resource not found')
      when 'null'
        nil
      else
        parsed_response = Nokogiri::XML::Reader(response.body)
        parsed_response = Hash.from_xml(parsed_response)
        parsed_response = Hashie::Mash.new(parsed_response)
        handle_httpclient_error(parsed_response) if parsed_response[:error]
        parsed_response
      end
    end
    
    def handle_httpclient_error(response)
      case response[:error][:status]
      when 404
        raise NotFound.new(response[:error][:message])
      end
    end
  end
end
