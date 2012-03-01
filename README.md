# Memo Rage #

Memo rage is a api wrapper for the service of tvrage.com
The gem is created to fulfil the need of the project watchmemo.com

## Installation ##

gem install memo_rage

## How to use it? ##

First you have to create a client with your api key

    client = MemoRage::Client.new(:key => "abcd1234")

You can search tv shows with

    client.search("NAME OF THE TV SHOW")

Get show info with

    client.show_info("THE ID OF THE SHOW")

Get show episode list

    client.episode_list("THE ID OF THE SHOW")
