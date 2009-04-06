class CreateAnnoters < ActiveRecord::Migration
  def self.up
    create_table :annoters do |t|
      t.integer :user_id
      t.integer :notebook_id
      t.string  :string

      t.timestamps
    end
  end

  def self.down
    drop_table :annoters
  end
end
