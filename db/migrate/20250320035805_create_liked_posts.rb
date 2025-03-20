class CreateLikedPosts < ActiveRecord::Migration[8.0]
  def change
    drop_table :likes
    create_table :liked_posts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
