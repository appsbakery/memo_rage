require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe MemoRage::Client do
  let(:client) { MemoRage::Client.new(:key => 'abcd1234') }
  
  describe '#build_params' do
    it 'should merge provided params with api key' do
      params = client.send :build_params, { :show => 'buffy' }
      params[:key].should == 'abcd1234'
      params[:show].should == 'buffy'
    end
  end
  
  describe '#build_endpoint' do
    it 'should merge path with root url' do
      client.send(:build_endpoint, 'search').should == "http://services.tvrage.com/myfeeds/search.php"
    end
  end
end