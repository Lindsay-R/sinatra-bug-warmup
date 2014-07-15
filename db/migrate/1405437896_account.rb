class Account < ActiveRecord::Migration
  def up
    create_table :account do |t|
      t.string :account_name
      t.integer :user_id
    end
  end

  def down
    # add reverse migration code here
  end
end
