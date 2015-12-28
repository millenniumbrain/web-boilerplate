Sequel.migration do
  up do
    create_table(:example) do
      primary_key :id
      Sting :name, :null => false
    end
  end

  down do
    drop_table(:example)
  end
end
