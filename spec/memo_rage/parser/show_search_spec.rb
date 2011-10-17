require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe MemoRage::Parser::ShowSearch do
  it 'should be awesome' do
    client = MemoRage::Client.new(:key => "abcd1234")
    mock_api :get, 'search', 'show_search', :params => client.params.merge(:show => "buffy") do
      show = client.search("buffy").first
      show.id.should == 2930
      show.name.should == "Buffy the Vampire Slayer"
    end
  end
end