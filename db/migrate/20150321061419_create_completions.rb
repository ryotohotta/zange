class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
