class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :login
      t.text :text
      t.references :product, index: true

      t.timestamps
    end
  end
end
