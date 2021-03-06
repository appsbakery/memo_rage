require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe MemoRage::Parser::ShowSearch do
  let(:client) { MemoRage::Client.new(:key => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'search', 'show_search', :params => client.params.merge(:show => "buffy") do
      show = client.search("buffy").first
      show.id.should == 2930
      show.name.should == "Buffy the Vampire Slayer"
    end
  end
  
  it 'should handle empty result set' do
    mock_api :get, 'search', 'show_search_empty', :params => client.params.merge(:show => "yolo") do
      client.search("yolo").should be_empty
    end
  end
end