require "memo_rage/version"
require 'httpclient'


module MemoRage
  ROOT_URL = "services.tvrage.com"
  DEFAULT_PARAMS = {
    :apiKey => "Ld3oukUu409XzrQVjhS3",
    :locale => "en_US",
    :timestamp => nil
  }

  class Exception < StandardError
    attr_accessor :code, :type, :message
    def initialize(code, message, body = '')
      @code = code
      if body.blank?
        @message = message
      else
        @message = 'Not Found'
        @code = response[:error][:code]
        @type = response[:@type]
      end
    end
  end

  class NotFound < Exception
    def initialize(message, body = '')
      super 404, message, body
    end
  end
end

require "memo_rage/node"
require "memo_rage/tvshow"
