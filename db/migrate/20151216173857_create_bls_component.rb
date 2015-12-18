class CreateBlsComponent < ActiveRecord::Migration
  def change
    create_table :bls_components do |t|
      t.timestamps
      t.string :location
      t.integer :location_id
      t.string :title
      t.string :title_id
    end
  end
end
