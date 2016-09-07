class Writing < ApplicationRecord
  belongs_to :wiki
  default_scope -> { order(id: :asc) }
end
