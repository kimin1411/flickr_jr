class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, uniqueness: true
  validates :username, :password, presence: true
  has_many :albums

  after_commit do
    self.albums.create(name:'default')
  end

  def self.authenticate(username, password)
    User.where(username:username, password:password).first
  end
end
