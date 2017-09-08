class CreateFabmoments < ActiveRecord::Migration[5.1]
  def change
    create_table :fabmoments do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
