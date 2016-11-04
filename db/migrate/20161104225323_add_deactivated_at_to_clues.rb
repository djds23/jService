class AddDeactivatedAtToClues < ActiveRecord::Migration
  def change
    add_column :clues, :deactivated_at, :datetime
  end
end
