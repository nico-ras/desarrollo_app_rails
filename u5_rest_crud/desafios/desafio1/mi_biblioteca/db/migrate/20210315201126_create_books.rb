class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :state
      t.date :loaned_date
      t.date :returning_date
      t.string :lend_to

      t.timestamps
    end
  end
end
