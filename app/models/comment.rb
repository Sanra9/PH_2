# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_product_id  (product_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#  user_id     (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user
end
