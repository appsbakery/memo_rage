module MemoRage
  class Node
    attr_accessor :identifier, :endpoint

    def initialize(identifier, options = {})
      @identifier = identifier
      @endpoint   = ROOT_URL << @identifier << API_KEY
    end
    
    def fetch(options = {})
      fetched = get(options)[:Results]
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
      case @identifier
      when 'search.php'
        '&' << params.to_params
      end   
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
        parsed_response = Hash.from_xml(response.body)
        parsed_response = Hashie::Mash.new(parsed_response)
        handle_httpclient_error(parsed_response) if parsed_response.empty?
        parsed_response
      end
    end
    
    def handle_httpclient_error(response)
      case response
      when response.empty?
        raise NotFound.new()
      end
    end
  end
end
