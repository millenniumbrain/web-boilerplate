Sequel.migration do
  up do
    create_table(:example_associations) do
      primary_key :id
      String :name, :null => false
      foreign_key :example_id
    end
  end
end
