class Book < ActiveRecord::Base

  after_save :post_process

  def scale_cover
    sleep(5)
    update_attribute(:cover, 'Cover scaled')
  end

  def post_process
    Resque.enqueue(CoverScaler, id)
  end
end
