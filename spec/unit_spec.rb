require 'rspec/core'
require 'rspec/expectations'

describe Example do
  before(:each) do
    @example = Example.create(:name => 'Moose')
  end

  it 'associations should be correct' do
    expect(@example.example_associations).to eq []
  end
end

describe ExampleAssociation do

  before(:each) do
    @example = Example.create(:name => 'Moose')
    @example_associations = ExampleAssociation.create(:name => 'Cool', :example_id => @example.id)
  end

  it 'associations should be correct' do
    expect(@example_associations.example.class).to eq Example 
  end
end
