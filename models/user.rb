class User < Sequel::Model(:users)
  one_to_many :example_associations

  def self.login(username, password)
    return unless username && password
    user = filter(name: username).first 
    password_hash = Locker::Password.new(
      hash: Base64.decode64(user.password_hash), 
      salt: Base64.decode64(user.password_salt))
    result = password_hash.compare(password)
    if result
      user
    else
      nil
    end
  end

  def password=(new_password)
    password = Locker::Password.new
    password.create(new_password)
    # some databases do not like binary encoding
    # so convert it to Base64 and decode it later
    self.password_hash = Base64.encode64(password.hash)
    self.password_salt = Base64.encode64(password.salt)
  end
end
