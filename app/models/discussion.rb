class Discussion < ApplicationRecord
    has_many(:comments, dependent: :destroy)
    validades (:title, presence: true)
end
