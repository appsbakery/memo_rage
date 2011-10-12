require "memo_rage/version"
require 'httpclient'
require 'nokogiri'
require 'hashie/mash'
require 'vendor/xml_to_hash'

module MemoRage
  ROOT_URL = "http://services.tvrage.com/myfeeds/"
  DEFAULT_PARAMS = {
    :type    => nil,
    :apiKey  => "Ld3oukUu409XzrQVjhS3",
    :title   => nil,
    :sid     => nil,
    :ep      => nil
  }

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
