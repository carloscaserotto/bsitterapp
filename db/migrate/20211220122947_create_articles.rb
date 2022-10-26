class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.text :description
      

      t.timestamps
    end
  end
end
