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
    has_many :comments
    has_many :votes

    has_one_attached :photo do |attachable|
        attachable.variant  :thumb,resize_to_limit: [100, 100]
        attachable.variant  :medium,resize_to_limit: [300, 300]
    end

    validate :photo_validation

    def photo_validation
        if photo.attached?
         if photo.blob.byte_size > 1000000
            photo.purge
            errors.add(:photo, :format, message: "Too big")
         elsif !photo.blob.content_type.starts_with?('image/') 
            photo.purge
            errors.add(:photo, :format, message: "Wrong format")
          end
        end
    end




    



    validates :name, presence: true
    validates :url, presence: true

    #validates_format_of :photo, with: => [/png\Z/, /jpe?g\Z/, /gif\Z/]

    #validates_inclusion_of :photo, :in => %w( jpg gif png ), :message => "extension %s is not included in the list"

    #validates_inclusion_of :photo, :in => %w( image/jpeg jpeg jpg gif png ), message: "Only allows images" 

    #validates_inclusion_of :photo, format: { with: /\Aimage\/.*\Z/, message: "Only allows images" }

    #validates_attachment_content_type :photo,  content_type: /\Aimage\/.*\Z/, message: "Only allows images" 


    #validates :photo, content_type: /\Aimage\/.*\Z/


    #validates_acceptance_of :photo, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

    
    #validates :photo, format: { with: /\Aimage\/.*\Z/, message: "Only allows images" }

    #validates :photo, content_type: /\Aimage\/.*\Z/

    #validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

    #validates :photo, attached: true, content_type: 'image/png'

    

    def voted_by?(user)
        votes.exists?(user: user)
    end

end
