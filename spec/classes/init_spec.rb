require 'spec_helper'
describe 'dataprotectoragent' do

  context 'with defaults for all parameters' do
    it { should contain_class('dataprotectoragent') }
  end
end
