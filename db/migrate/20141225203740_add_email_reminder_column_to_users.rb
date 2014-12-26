class AddEmailReminderColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_reminder, :boolean, default: false
  end
end
