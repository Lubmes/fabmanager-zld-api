class CreateUsages < ActiveRecord::Migration[5.1]
  def change
    create_table :usages do |t|
      t.belongs_to :machine, index: true
      t.integer :capacity
      t.integer :in_use

      t.timestamps
    end

    remove_column :machines, :usage
    remove_column :machines, :capacity
  end
end
