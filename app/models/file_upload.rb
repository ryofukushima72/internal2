class FileUpload < ActiveRecord::Base
	#include ActiveModel::Model
	belongs_to :project
	# belongs_to :sale
	validates :category, presence: true
	#attr_accessor :search_word
end
