class CreateMachineOccupations < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_occupations do |t|
      t.references :machine, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
