class ContactMessage < ActiveRecord::Base
  validates :author, presence: true
  validates :title, presence: true, length: { in: 3..50 }
  validates :text, presence: true, length: { in: 10..1000 }
end
