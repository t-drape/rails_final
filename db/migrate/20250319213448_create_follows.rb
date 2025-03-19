class CreateFollows < ActiveRecord::Migration[8.0]
  def change
    create_table :follows do |t|
      t.column :follower_id, :integer
      t.index [ 'follower_id' ], name: 'follower_id'

      t.column :influencer_id, :integer
      t.index [ 'influencer_id' ], name: 'influencer_id'
      t.timestamps
    end
  end
end
