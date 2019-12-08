class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  acts_as_votable

  def self.sortedbymostrecent
    self.all.sort_by { |post| post[:created_at] }.reverse
  end

  # def linebreak
  #   self.image.split("\r\n")
  # end

end
