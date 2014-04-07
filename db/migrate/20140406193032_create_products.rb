class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :mark
      t.integer :voters

      t.timestamps
    end
  end
end
