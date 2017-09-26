class CreateControles < ActiveRecord::Migration[5.1]
  def change
    create_table :controles do |t|
      t.references :fabmoment, index: true
      t.references :program, index: true

      t.timestamps
    end
  end
end
