class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :by
      t.integer :descendants
      t.integer :hnid
      t.integer :score
      t.integer :time
      t.string :title
      t.string :url
      t.timestamps
    end
  end
end





