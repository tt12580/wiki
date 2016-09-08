class Notice < ApplicationRecord
  validates :title, presence:true, length: { maximum: 50 }
  validates :body, presence: true
  default_scope -> { order(id: :asc) }
  acts_as_paranoid
  scope :search_title, -> (title) { where("title like '%#{title}%'") if title.present? }
  scope :search_body, -> (body) { where("body like '%#{body}%'") if body.present? }
  scope :search_notice_id, -> (id) { where(id: id) if id.present? }
end
