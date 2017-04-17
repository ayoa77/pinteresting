class Purchase < ApplicationRecord
belongs_to :pin
belongs_to :buyer, class_name: 'User'
end
