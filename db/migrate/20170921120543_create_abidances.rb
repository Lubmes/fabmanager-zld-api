class CreateAbidances < ActiveRecord::Migration[5.1]
  def change
    create_table :abidances do |t|
      t.references :fabmoment, index: true
      t.references :license, index: true

      t.timestamps
    end
  end
end
