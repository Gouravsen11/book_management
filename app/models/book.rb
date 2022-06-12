class Book < ApplicationRecord
  #Association

  has_many :authors_books, dependent: :destroy, class_name: "AuthorsBooks"
  has_many :authors, through: :authors_books

  validates_presence_of :name

  def update_authors(authors_ids)
    existing_author_ids = authors.ids
    (authors_ids - existing_author_ids).each do |u|
      authors_books.find_or_create_by(author_id: u)
    end
  end
end
