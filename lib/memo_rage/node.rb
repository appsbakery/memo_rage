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
    def build_params(params = {})
      DEFAULT_PARAMS.merge(:timestamp => Time.now.to_i.to_s).merge(params)
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
      when 401, 403
        raise Unauthorized.new(response[:error][:message])
      when 404
        raise NotFound.new(response[:error][:message])
      else
        raise BadRequest.new(response[:error][:message])
      end
    end
  end
end
