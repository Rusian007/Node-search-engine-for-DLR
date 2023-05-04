class CreateRules < ActiveRecord::Migration[7.0]
  def change
    create_table :rules do |t|
      t.text :title
      t.string :subsection
      t.integer :year

      t.timestamps
    end
  end
end
