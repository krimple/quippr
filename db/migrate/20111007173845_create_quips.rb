class CreateQuips < ActiveRecord::Migration
  def change
    create_table :quips do |t|
      t.string :phrase
      t.date :pubdate
      t.integer :ranking, :default => 0

      t.timestamps
    end
  end
end
