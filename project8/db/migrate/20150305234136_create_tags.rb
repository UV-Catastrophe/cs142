class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.belongs_to :photo, index:true
    	t.belongs_to :user, index: true
    	
    	t.integer :left_px
    	t.integer :top_px
    	t.integer :width_px
    	t.integer :height_px

    	t.timestamps null: false
    end
  end
end
