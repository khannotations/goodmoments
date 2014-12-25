class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
