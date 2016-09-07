class Wenzhang < ApplicationRecord
  belongs_to :taxon
  default_scope -> { order(created_at: :desc) }
  validates :taxon_id, presence: true
end
