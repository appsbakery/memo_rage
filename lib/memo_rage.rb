require "httpclient"
require "rexml/document"
require "memo_rage/version"

module MemoRage
  ROOT_URL = "http://services.tvrage.com/myfeeds"
end

require "memo_rage/node"
require "memo_rage/show"
require "memo_rage/episode"
require "memo_rage/client"
require "memo_rage/parser"
