class Wiki < ApplicationRecord
  has_many :writings, dependent: :destroy
  validates :mulu, presence: true
  default_scope -> { order(id: :asc) }
  acts_as_paranoid
  scope :search_mulu, -> (mulu) { where("mulu like '%#{mulu}%'") if mulu.present? }
  scope :search_wiki_id, -> (id) { where(id: id) if id.present? }
end
