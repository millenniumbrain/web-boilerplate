require 'rspec/core'
require 'rspec/expectations'
require 'spec_helper'

describe User do
  before(:each) do
    @user = User.create(:name => 'Moose')
    puts @user
  end

=begin
  it 'associations should be correct' do
    expect(@example.example_associations).to eq []
  end
=end
end

=begin
describe ExampleAssociation do

  before(:each) do
    @example = Example.create(:name => 'Moose')
    @example_associations = ExampleAssociation.create(:name => 'Cool', :example_id => @example.id)
  end

  it 'associations should be correct' do
    expect(@example_associations.example.class).to eq Example 
  end
end
=end
