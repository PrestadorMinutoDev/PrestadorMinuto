class Image < ActiveRecord::Base
  belongs_to :ad

  has_attached_file :pictures, styles: { original: "128x128>", thumb: "50x50>"},
                    default_url: "/assets/images/nobody_default.jpg",
                    path: "#{Rails.root}/public/assets/ads/:id/:style/:basename.:extension",
                    url: '/assets/ads/:id/:style/:basename.:extension'
  validates_attachment_content_type :pictures,  size: { in: 0..30.kilobytes }, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end
