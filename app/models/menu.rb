

class Menu < ApplicationRecord
  self.table_name="sn_food"
  validates :fid, presence: true, length: {minimum:1}
  validates :fpic, presence: true, length: {minimum:1}
  validates :fname, presence: true, length: {minimum:1}
  validates :fprice, presence: true
  validates :fctime, presence: true, length: {minimum:10}
end
