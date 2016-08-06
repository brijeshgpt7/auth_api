class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :original_url
      t.string :short_url
      t.integer :user_id
      t.integer :visits_count

      t.timestamps null: false
    end
  end
end
