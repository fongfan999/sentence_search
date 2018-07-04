class CreateSubtitleSources < ActiveRecord::Migration[5.2]
  def change
    create_table :subtitle_sources do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
