class AddApplicatitonCodeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :application_code, :string
  end
end
