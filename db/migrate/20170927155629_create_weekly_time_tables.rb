class CreateWeeklyTimeTables < ActiveRecord::Migration[5.1]
  def change
    create_table :weekly_time_tables do |t|
      t.belongs_to :control_panel, foreign_key: true
      t.string :title
      t.string :subtitle
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
