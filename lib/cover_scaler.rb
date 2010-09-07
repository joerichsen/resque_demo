class CoverScaler
  @queue = :image_processing

  def self.perform(id)
    book = Book.find(id)
    book.scale_cover
  end
end
