class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :body, null: false
      t.string :short, null: false
      t.integer :click_count, default: 0

      t.timestamps null: false
    end

    add_index :urls, :short, unique: true
  end
end
