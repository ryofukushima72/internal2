class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
	t.string :no
	t.string :company
	t.string :charge
	t.text   :task
	t.integer :y1801, default: 0, null: false
	t.integer :y1802, default: 0, null: false
	t.integer :y1803, default: 0, null: false
	t.integer :y1804, default: 0, null: false
	t.integer :y1805, default: 0, null: false
	t.integer :y1806, default: 0, null: false
	t.integer :y1807, default: 0, null: false
	t.integer :y1808, default: 0, null: false
	t.integer :y1809, default: 0, null: false
	t.integer :y1810, default: 0, null: false
	t.integer :y1811, default: 0, null: false
	t.integer :y1812, default: 0, null: false
	t.integer :y1901, default: 0, null: false
        t.integer :y1902, default: 0, null: false
        t.integer :y1903, default: 0, null: false
	t.integer :y1904, default: 0, null: false
	t.integer :y1905, default: 0, null: false
	t.integer :y1906, default: 0, null: false
	t.integer :y1907, default: 0, null: false
	t.integer :y1908, default: 0, null: false
	t.integer :y1909, default: 0, null: false
	t.integer :y1910, default: 0, null: false
	t.integer :y1911, default: 0, null: false
	t.integer :y1912, default: 0, null: false
	t.integer :y2001, default: 0, null: false
	t.integer :y2002, default: 0, null: false
	t.integer :y2003, default: 0, null: false
	t.integer :sum_int_month_rf
	t.integer :sum_int_rf
	t.integer :sum_int
	t.date :contract
	t.date :deposit
	t.date :depomonth
	t.date :inspe
	t.date :insmonth
	t.date :start
	t.date :end
	t.date :delivery
	t.date :deliverymonth
	t.integer :pjprice, default: 0, null: false
	t.integer :plancost, default: 0, null: false
	t.integer :realcost, default: 0, null: false
	t.integer :type_id
	t.integer :team_id
	t.integer :tech_id
	t.integer :factor_id
	t.integer :level_id
	t.text :remarks



    end
  end
end
