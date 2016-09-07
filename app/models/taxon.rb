class Taxon < ApplicationRecord
  has_many :wenzhangs, dependent: :destroy
  default_scope -> { order(id: :asc) }
end
