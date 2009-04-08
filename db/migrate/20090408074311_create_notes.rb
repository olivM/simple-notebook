class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.integer :notebook_id
      t.string  :name
      t.text    :content
      t.integer :rank, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
