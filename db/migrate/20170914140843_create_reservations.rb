class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :approved, default: false

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
