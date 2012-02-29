# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe MemoRage::Parser::ShowInfo do
  let(:client) { MemoRage::Client.new(:key => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'showinfo', 'show_info', :params => client.params.merge(:sid => "2930") do
      show = client.show_info("2930")
      show.id.should == 2930
      show.name.should == "Buffy the Vampire Slayer"
      show.link.should == "http://www.tvrage.com/Buffy_The_Vampire_Slayer"
      show.seasons.should == 7
      show.image.should == "http://images.tvrage.com/shows/3/2930.jpg"
      show.started.should == "1997"
      show.origin_country.should == "US" 
      show.status.should == "Canceled/Ended"
      show.classification.should == "Scripted"
      show.genres.should =~ [ "Action", "Adventure", "Comedy", "Drama", "Mystery", "Sci-Fi" ]
      show.runtime.should == 60
      show.airtime.should == "20:00" 
      show.airday.should == "Tuesday"
      show.timezone == "GMT-5 -DST"
      show.akas =~ [ "Buffy & vampyrerna", "Buffy - Im Bann der Dämonen", "Buffy - Vampyrenes skrekk", "Buffy a vámpírok réme", "Buffy Contre les Vampires", "Buffy l'Ammazza Vampiri", "Buffy postrach wampirów", "Buffy, a Caça-Vampiros", "Buffy, a Caçadora de Vampiros", "Buffy, Cazavampiros", "Buffy, ubojica vampira", "Buffy, vampyyrintappaja", "Vampiiritapja Buffy", "Vampírubaninn Buffy" ]
    end
  end
end

