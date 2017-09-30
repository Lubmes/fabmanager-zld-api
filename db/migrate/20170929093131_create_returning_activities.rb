class CreateReturningActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :returning_activities do |t|
      t.belongs_to :weekly_time_table, foreign_key: true
      t.integer :day
      t.time :start_time
      t.time :end_time
      t.string :caption

      t.timestamps
    end
  end
end
