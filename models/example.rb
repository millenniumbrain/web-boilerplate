class Example < Sequel::Model(:example)
  one_to_many :example_associations
end
