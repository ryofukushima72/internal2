class CreateApprovals < ActiveRecord::Migration[6.0]
  def change
    create_table :approvals do |t|

	t.integer :user_id, null: false
	t.integer :project_id, null: false
	t.string :level, null: false
	t.boolean :commit, default: false
	t.string :prelevel
	t.string :appuser

	t.timestamps
    end
  end
end
