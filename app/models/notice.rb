class Notice < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  validates :title, presence:true, length: { maximum: 50 }
  validates :body, presence: true
  validate :picture_size
  mount_uploader :picture, PictureUploader
  default_scope -> { order(id: :asc) }
  scope :search_title, -> (title) { where("title like '%#{title}%'") if title.present? }
  scope :search_body, -> (body) { where("body like '%#{body}%'") if body.present? }
  scope :search_notice_id, -> (id) { where(id: id) if id.present? }

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB ")
      end
    end
end
