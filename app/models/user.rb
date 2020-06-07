class User < ApplicationRecord
  has_many :record, dependent: :destroy
  has_many :mywork, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: true, length: { in: 4..12 }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[\W_])[!-~]+\z/i
  validates :password, presence: true, allow_nil: true, length: { in: 8..16 }, format: { with: VALID_PASSWORD_REGEX }
  validates :description, length: { maximum: 200 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def search(search)
    if search
      User.where("name LIKE ? AND id != ?", "%#{search}%", id)
    else
      User.where.not("id = ?", id)
    end
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    Record.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id).order(created_at: "DESC")
  end
  
  def feed_mine
    Record.where("user_id = ?", id).order(created_at: "DESC")
  end

  def count_30days
    record.where(start_time: (30.days.ago)..(Time.now)).count
  end
end
