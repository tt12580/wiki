class Wenzhang < ApplicationRecord
  belongs_to :taxon
  default_scope -> { order(created_at: :desc) }
  validates :head, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :taxon_id, presence: true
  acts_as_paranoid
  scope :search_head, -> (head) { where("head like '%#{head}%'") if head.present? }
  scope :search_content, ->(content) { where("content like '%#{content}%'") if content.present? }
  scope :search_wenzhang_id, ->(id) { where(id: id) if id.present? }
  scope :search_taxon_list, -> (list) { eager_load(:taxon).where("taxons.list like '%#{list}%'") if list.present? }
end
