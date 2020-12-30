class Bill < ApplicationRecord
  belongs_to :customer, :foreign_key=>"customer_id"
  validates :year, :presence => true
  validates :amount, :presence => true
  validates :month, :presence => true
  validates :staff_name, :presence => true
  validates :staff_email, :presence => true
  validates :month, uniqueness:  {:scope => [:customer_id, :year]}
end
