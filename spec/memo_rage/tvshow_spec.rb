require 'spec_helper'

describe MemoRage::TvShow, '.find' do
  context 'with valid title given' do
    it 'should get main title' do
      mock_api :get, 'myfeeds', :params => { :type => 'search', :title => 'buffy', :sid => '', :ep => '' } do
        movie = MemoRage::TvShow.find('buffy')
        movie.title.should == "Buffy"
      end
    end
  end
end
