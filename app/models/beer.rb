class Beer < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :beer_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpg')
    end
    # image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "parfect_match"
      @beer = Beer.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @beer = Beer.where("name LIKE?", "#{word}%")
    elsif search == "backward_match"
      @beer = Beer.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @beer = Beer.where("name LIKE?", "%#{word}%")
    else
      @beer = Beer.all
    end
  end
end
