class User < ActiveRecord::Base
  attr_accessible :email_address, :name, :password, :password_confirmation
  attr_accessor :password

  validates_presence_of :email_address, :name, :password
  validates_uniqueness_of :email_address, :case_sensitive => false
  validates_confirmation_of :password

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def remember_me!
    self.remember_token = encrypt("#{salt}--#{id}--#{Time.now.utc}")
    save_without_validation
  end

  def self.authenticate(email_address, submitted_password)
    user = find_by_email_address(email_address)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  private

  def encrypt_password
    unless password.nil?
      self.salt = make_salt
      self.encrypted_password = encrypt(password)
    end
  end

  def encrypt(string)
    secure_hash("#{salt}#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
