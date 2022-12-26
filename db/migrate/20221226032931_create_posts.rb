class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :string
      t.string :descrition
      t.string :text

      t.timestamps
    end
  end
end
