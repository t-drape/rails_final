class CreateUsersUsers < ActiveRecord::Migration[8.0]
  def change
    drop_table :users_users
    create_table :users_users do |t|
      t.column :follower_id, :integer
      t.index [ 'follower_id' ], name: 'follower_id'

      t.column :influencer_id, :integer
      t.index [ 'influencer_id' ], name: 'influencer_id'
      t.timestamps
    end
  end
end
