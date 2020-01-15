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
  validate  :image_size
  
  private

    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "画像サイズは5MB以内です")
      end
    end
end
