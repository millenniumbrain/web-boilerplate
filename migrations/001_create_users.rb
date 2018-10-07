Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :full_name
      String :email, null: false
      String :name, null: false
      String :activation_token 
      String :password_hash, null: false
      String :password_salt, null: false
      FalseClass :activated, default: false
      DateTime :token_expiration
      DateTime :activated_at 
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:users)
  end
end
