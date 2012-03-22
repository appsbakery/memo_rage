# Memo Rage #

An object-oriented Ruby wrapper for the TVRage API http://services.tvrage.com

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
