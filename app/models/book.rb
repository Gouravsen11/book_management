class Book < ApplicationRecord
  #Association
  has_and_belongs_to_many :authors

  validates_presence_of :name

  def update_books(book, authors, book_params)
    @book = book
    @book.authors.destroy_all
    @book.name = book_params[:name]
    @book.edition = book_params[:edition]
    @book.publication_year = book_params[:publication_year]
    authors.each do |author|
      @book.authors << author
    end
    @book
  end
end
