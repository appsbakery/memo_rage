require "memo_rage/version"
require 'httpclient'
require 'hashie/mash'
require 'vendor/xml_to_hash'
require 'vendor/to_params'

module MemoRage
  ROOT_URL = "http://services.tvrage.com/myfeeds/"
  API_KEY  = "?key=Ld3oukUu409XzrQVjhS3"

  class Exception < StandardError
    attr_accessor :code, :type, :message
    def initialize(code, message, body = '')
      @code = code
      if body.blank?
        @message = message
      else
        @message = 'Not Found'
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
