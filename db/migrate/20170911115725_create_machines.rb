class CreateMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :machines do |t|
      t.string :name
      t.integer :usage
      t.integer :capacity

      t.timestamps
    end
  end
end
