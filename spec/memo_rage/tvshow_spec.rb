require 'spec_helper'

describe MemoRage::TvShow, '.find' do
  context 'with valid tconst given' do
    it 'should get main details' do
      mock_api :get, 'title/maindetails', 'title/maindetails-buffy', :params => { :tconst => 'buffy', :title => 'Buffy', :year => '2011' } do
        movie = MemoRage::TvShow.find('buffy')
        movie.tconst.should == "buffy"
        movie.title.should == "Buffy"
        movie.year.should == "2011"
      end
    end
  end
end
