class Author < ApplicationRecord
	#Association
	has_many :authors_books, dependent: :destroy, class_name: "AuthorsBooks"
	has_many :books, through: :authors_books

	validates_presence_of :name
end
