class CreateAllowedWebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :allowed_websites do |t|
      t.string :domain
      t.references :user, null: false, foreign_key: true, on_delete: :cascade


      t.timestamps
    end
  end
end
