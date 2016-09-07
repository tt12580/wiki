class Notice < ApplicationRecord
  default_scope -> { order(id: :asc) }
end
