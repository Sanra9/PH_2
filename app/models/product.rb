# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Product < ActiveRecord::Base 
    belongs_to :user

    validates :name, presence: true
    validates :url, presence: true
end
