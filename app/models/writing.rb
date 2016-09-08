class Writing < ApplicationRecord
  belongs_to :wiki
  default_scope -> { order(id: :asc) }
  validates :name, presence: true, length: { maximum: 50  }
  validates :mainbody, presence: true
  validates :wiki_id, presence: true
  acts_as_paranoid
  scope :search_name, -> (name) { where("name like '%#{name}%'") if name.present? }
  scope :search_mainbody, -> (mainbody) { where("mainbody like '%#{mainbody}%'") if mainbody.present? }
  scope :search_writing_id, -> (id) { where(id: id) if id.present? }
  scope :search_wiki_mulu, -> (mulu) { eager_load(:wiki).where("wikis.mulu like '%#{mulu}%'") if mulu.present? }
end
