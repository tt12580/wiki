class Wiki < ApplicationRecord
  has_many :writings
  default_scope -> { order(id: :asc) }
end
