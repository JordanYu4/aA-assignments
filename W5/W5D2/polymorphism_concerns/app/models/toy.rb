# == Schema Information
#
# Table name: toys
#
#  id           :bigint(8)        not null, primary key
#  name         :string           not null
#  toyable_id   :bigint(8)
#  toyable_type :string
#

class Toy < ApplicationRecord
  validates :name, uniqueness: { scope: [:toyable] }
  belongs_to :toyable, polymorphic: true
end
