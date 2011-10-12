require 'spec_helper'

describe MemoRage::TvShow, '.find' do
  context 'with valid title given' do
    it 'should get main title' do
      stub_request(:get, "http://services.tvrage.com/title/maindetails?apiKey=Ld3oukUu409XzrQVjhS3&locale=en_US&timestamp=1318417525&title=Buffy") do
        movie = MemoRage::TvShow.find('buffy')
        movie.title.should == "Buffy"
      end
    end
  end
end
