class Pin < ApplicationRecord
  include PgSearch
  belongs_to :user, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  pg_search_scope :search_pins, against: [:description, :title],
                 :using => {
   tsearch:    {dictionary: 'english', prefix: true},
   trigram:    {threshold:  0.3},
   dmetaphone: {}
 }
end
