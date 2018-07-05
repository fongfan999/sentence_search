class CreateSubtitles < ActiveRecord::Migration[5.2]
  def change
    create_table :subtitles do |t|
      t.text :english
      t.text :vietnamese
      t.references :subtitle_source, foreign_key: true

      t.timestamps
    end
  end
end
