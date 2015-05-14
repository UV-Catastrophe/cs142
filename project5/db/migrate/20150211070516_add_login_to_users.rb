class AddLoginToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string

    User.all.each do |user|
      user.login = user.last_name.downcase
      user.save!(:validate => false)
    end
  end
end
