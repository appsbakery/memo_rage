require 'spec_helper'

describe MemoRage::TvShow, '.find' do
  context 'with valid title given' do
    it 'should get main title' do
      mock_api :get, 'myfeeds','myfeeds/show-buffy', :params => { :title => 'buffy'} do
        movie = MemoRage::TvShow.find('buffy')
        movie.show.first.name.should == "Buffy the Vampire Slayer"
      end
    end
  end
end
