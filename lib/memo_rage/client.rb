module MemoRage
  class Client
    attr_reader :params
    
    def initialize(options)
      @params = { :key => options[:key] }
    end
    
    def search(query)
      content = get("search", { :show => query })
      parser = MemoRage::Parser::ShowSearch.new content
      parser.parse
    end
    
    private
    def get(path, params = {})
      HTTPClient.get build_endpoint(path), build_params(params)
    end
    
    def build_params(params = {})
      @params.merge(params)
    end
    
    def build_endpoint(path)
      File.join(MemoRage::ROOT_URL, "#{path}.php")
    end
  end
end