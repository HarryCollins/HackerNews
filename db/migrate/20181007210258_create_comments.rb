class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :by
      t.integer :hnid
      t.references :story, index: true, foreign_key: true
      t.string :text
      t.integer :time
      t.timestamps
    end
  end
end
