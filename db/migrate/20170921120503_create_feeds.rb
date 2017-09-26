class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.references :fabmoment, index: true
      t.references :material, index: true

      t.timestamps
    end
  end
end
