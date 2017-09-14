class CreateControlPanels < ActiveRecord::Migration[5.1]
  def change
    create_table :control_panels do |t|
      t.integer :max_machines_to_occupy
      t.integer :max_minutes_to_occupy_one_machine
      t.boolean :open_hour

      t.timestamps
    end
  end
end
