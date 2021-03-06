class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :product, index: true
      t.float :score, default: 0.0

      t.timestamps
    end
  end
end
