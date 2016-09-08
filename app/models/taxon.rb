class Taxon < ApplicationRecord
  has_many :wenzhangs, dependent: :destroy
  validates :list, presence: true
  default_scope -> { order(id: :asc) }
  acts_as_paranoid
  scope :search_list, -> (list) { where("list like '%#{list}%'") if list.present? }
  scope :search_taxon_id, -> (id) { where(id: id) if id.present? }
end
