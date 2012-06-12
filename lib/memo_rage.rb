require "nokogiri"
require "httpclient"
require "active_support/core_ext/object/try"
require "active_support/core_ext/object/blank"

require "memo_rage/version"

module MemoRage
  ROOT_URL = "http://services.tvrage.com/myfeeds"
end

require "memo_rage/node"
require "memo_rage/show"
require "memo_rage/episode"
require "memo_rage/client"
require "memo_rage/parser"
