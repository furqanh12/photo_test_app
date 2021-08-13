class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :privacy, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
