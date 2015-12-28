class ExampleAssociation < Sequel::Model(:example_associations)
  many_to_one :example
end
