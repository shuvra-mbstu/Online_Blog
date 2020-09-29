class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false, index: { unique: true }
      t.text :text, null: false

      t.timestamps null: false
    end
  end
end
