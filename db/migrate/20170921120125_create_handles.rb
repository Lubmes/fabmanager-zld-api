class CreateHandles < ActiveRecord::Migration[5.1]
  def change
    create_table :handles do |t|
      t.references :fabmoment, index: true
      t.references :machine, index: true

      t.timestamps
    end
  end
end
