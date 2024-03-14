class RenameBugStatusToBUgStatus < ActiveRecord::Migration[7.0]
  def change
    rename_column :bugs, :status, :bug_status

  end
end
