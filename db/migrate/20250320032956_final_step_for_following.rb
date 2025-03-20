class FinalStepForFollowing < ActiveRecord::Migration[8.0]
  def change
    drop_table :users_users
    create_table :follows do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.references :influencer, null: false, foreign_key: { to_table: :users }
    end

    add_index :follows, [ :follower_id, :influencer_id ], unique: true
  end
end
