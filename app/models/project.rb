class Project < ActiveRecord::Base
	#include ActiveModel::Model
	#attr_accessor :search

	validates :no, uniqueness: true

	validates :no, :company, :charge, :task, presence: true
	validates :counta, :countb, :countc, :countd, :counte, :countf, :countg, presence: true
	validates :y1801, :y1802, :y1803, :y1804, :y1805, :y1806, :y1807, :y1808, :y1809, :y1810, :y1811, :y1812, presence: true
	validates :y1901, :y1902, :y1903, :y1904, :y1905, :y1906, :y1907, :y1908, :y1909, :y1910, :y1911, :y1912, :y2001, :y2002, :y2003, presence: true
	validates :pjprice, :plancost, :realcost, presence: true
	has_many :file_uploads
	has_many :sales
	has_many :approvals
	

	# def self.search(search)
	# 	if search 
	# 		#Project.where(['name LIKE ?', "%#{search}%"])
	# 		#find(:all, :conditions => ['name Like ?',"%#{search}%"])
	# 	else
	# 		Project.all
	# 		#find(:all)
	# 	end
	# 	#y1804_price_rf= Project.where(:id => id).select("sum(projects.y1804 * projects.y1804_price_rf) as total, projects.id").group(:id).order(nil)
	# 	#puts y1804_price_rf
	# end

end
