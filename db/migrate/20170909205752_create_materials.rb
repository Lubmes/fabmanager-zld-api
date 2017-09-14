class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :short_description
      t.integer :thickness

      t.timestamps
    end
  end
end
