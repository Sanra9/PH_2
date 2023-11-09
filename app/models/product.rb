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
#
class Product < ActiveRecord::Base 
    validates :name, presence: true
    validates :url, presence: true
end
