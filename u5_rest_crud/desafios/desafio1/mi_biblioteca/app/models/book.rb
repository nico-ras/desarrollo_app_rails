class Book < ApplicationRecord
    validates :title,:author, presence: true

    enum state: [:prestado, :en_estante]
end
