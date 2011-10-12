require 'spec_helper'

describe MemoRage::TvShow, '.find' do
  context 'with valid title given' do
    it 'should get main title' do
      mock_api :get, 'myfeeds','myfeeds/show-buffy', :params => { :type => 'search', :title => 'buffy'} do
        movie = MemoRage::TvShow.search('buffy')
        movie.title.should == "Buffy"
      end
    end
  end
end
