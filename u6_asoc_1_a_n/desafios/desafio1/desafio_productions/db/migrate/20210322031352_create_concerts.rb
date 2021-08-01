class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.belongs_to :band, null: false, foreign_key: true
      t.integer :attendace, default: 0
      t.integer :duration, default: 0
      t.date :date

      t.timestamps
    end
  end
end
