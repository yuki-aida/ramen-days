class Shop < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 40 }
  validates :adress, presence: true
  validates :area, presence: true
  validates :station, presence: true
  validates :tel, presence: true
  validates :business_hour, presence: true
  validates :holiday, presence: true
  validates :access, presence: true
  validates :map, presence: true
  validate  :image_size
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  
  def iine(user)
    likes.create(user_id: user.id)
  end

  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end
  
  def iine?(user)
    iine_users.include?(user)
  end
  
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  
  private

    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "画像サイズは5MB以内です")
      end
    end
end
