class User < ApplicationRecord
  before_save :downcase_email
  # before_create :create_activation_digest
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }, allow_nil: true
  # validates :profile, length: { maximum: 160 }
  # mount_uploader :picture, PictureUploader
  # validate  :picture_size
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
   private
    def downcase_email
      self.email = self.email.downcase
    end
  
end
