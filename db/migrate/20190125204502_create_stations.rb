class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :state
      t.string :altitude
      t.string :opening
      t.string :partial_opening
      t.integer :snowpark
      t.text :styles
      t.text :contact
      t.text :domains
      t.text :snowfall
      t.text :open_domains
      t.text :ski_pass
      t.text :weather

      t.timestamps
    end
  end
end
