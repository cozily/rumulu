class AddDisabledToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :disabled, :boolean, default: false, null: false
  end
end
