module Locker
  extend self

  def encode_token(payload:)
    exp = Time.now.to_i + 4 * 3600
    exp_payload = { data: payload, exp: exp }
    JWT.encode(exp_payload, ENV['HMAC_SECRET'], 'HS256')
  end

  def decode_token(token:)
    begin
      JWT.decode(token, ENV['HMAC_SECRET'], true, {algorithm: 'HS256'})
    rescue JWT::DecodeError
      false
    rescue JWT::ExpiredSignature
      false
    end
  end

  class Password
    attr_accessor :salt, :hash
    def initialize(hash: "", salt: "")
      @hash = hash
      @salt = salt
    end

    def compare(password)
      compare_hash = RbNaCl::PasswordHash.scrypt(
        password,
        @salt.b,
        ENV['OPS_LIMIT'].to_i,
        ENV['MEM_LIMIT'].to_i,
        ENV['DIGEST_SIZE'].to_i)
        # libsodium returns a binary hash so make sure both
        # hashes are binary strings and then compare them 
        if @hash.b == compare_hash.b
          true
        else
          false
        end      
    end

    def create(password)
      salt = RbNaCl::Random.random_bytes(RbNaCl::PasswordHash::SCrypt::SALTBYTES) 
    
      hash = RbNaCl::PasswordHash.scrypt(
        password,
        salt,
        ENV['OPS_LIMIT'].to_i,
        ENV['MEM_LIMIT'].to_i,
        ENV['DIGEST_SIZE'].to_i).b
      @hash = hash.b
      @salt = salt.b
    end
  end
end