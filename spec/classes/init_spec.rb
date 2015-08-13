require 'spec_helper'
describe 'facter' do

  context 'with defaults for all parameters' do
    it { should contain_class('facter') }
  end
end
