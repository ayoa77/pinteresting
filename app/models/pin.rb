class Pin < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :purchases
  has_many :buyers, through: :purchases
  pg_search_scope :search_pins, against: [:description, :title],
                 :using => {
   tsearch:    {dictionary: 'english', prefix: true},
   trigram:    {threshold:  0.3},
   dmetaphone: {}
 }

 dragonfly_accessor :image
 validates :title, presence: true
 validates :image, presence: true
 validates_size_of :image, maximum: 500.kilobytes,
                   message: "should be no more than 500 KB", if: :image_changed?

 validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                    message: "should be either .jpeg, .jpg, .png, .bmp", if: :image_changed?

end
