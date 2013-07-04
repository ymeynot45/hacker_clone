class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :username, presence: true
  validates :username, :uniqueness => true
  validates :username, length: {minimum: 6, maximum: 15}
  validates :password_hash, presence: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
    # self.raw_password = new_password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == password
      return user
    else
      nil
    end
  end

end
