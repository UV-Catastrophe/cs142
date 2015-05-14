class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :photo, index:true
      t.belongs_to :user, index:true

      t.datetime :date_time
      t.text :comment
      
      t.timestamps null: false
    end
  end
end
