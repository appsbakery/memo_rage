require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe MemoRage::Parser::EpisodeList do
  let(:client) { MemoRage::Client.new(:key => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'episode_list', 'episode_list', :params => client.params.merge(:sid => "2930") do
      list = client.episode_list("2930")
      list.name.should == "Buffy the Vampire Slayer"
      list.seasons.should == 7
      list.episodes.last.season.should == 7
    end
  end
end
