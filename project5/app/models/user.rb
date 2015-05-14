class User < ActiveRecord::Base
	attr_accessor :password

	has_many :photos
	has_many :comments

	validates_presence_of :first_name
	validates_presence_of :last_name

	validates :login, :presence => true, :uniqueness => true, :length => { :in => 5..30 }
	validates :password, :confirmation => true
    validates_length_of :password, :in => 6..20, :on => :create

	before_save :create_password_digest
	after_save :clear_password

	def password_valid?(password)
		generate_password_digest(password) == self.password_digest
	end

	def generate_password_digest(pw)
		Digest::SHA1.hexdigest(pw + self.salt)
	end

	def create_password_digest
	  if password.present?
	    self.salt = rand(999999).to_s
	    self.password_digest = generate_password_digest(password)
	  end
	end

	def clear_password
	  self.password = nil
	end
end
