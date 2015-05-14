class SetPasswords < ActiveRecord::Migration
	def change
		User.all.each do |user|
			user.password = user.login.downcase
			user.create_password_digest
			user.save!(:validate => false)
		end
	end
end
