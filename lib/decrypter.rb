class Decrypter
  def cipher
    OpenSSL::Cipher::Cipher.new('aes-256-cbc')  # ('aes-256-cbc')
  end

  def get_cipher_salt
    BCrypt::Engine.generate_salt
  end

  def decrypt(value,cipher_key)
    c = cipher.decrypt
    c.key = Digest::SHA256.digest(cipher_key)
    c.update(Base64.decode64(value.to_s)) + c.final
  end

  def encrypt(value,cipher_key)
    c = cipher.encrypt
    c.key = Digest::SHA256.digest(cipher_key)
    Base64.encode64(c.update(value.to_s) + c.final)
  end

  def create_hash(text_to_hash,salt)
    my_password = BCrypt::Engine.hash_secret(text_to_hash, salt)
  end
end