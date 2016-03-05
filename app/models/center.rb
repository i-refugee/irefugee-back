class Center < ActiveRecord::Base
	#include Visible
	after_save :inform_newsfeed

	has_many :tokens , :foreign_key => "center_id"
	has_many :center_keywords
	has_many :keywords, through: :center_keywords
	has_many :statuses

	mount_uploader :image, CenterImageUploader

	before_create :validate

	has_many :center_needs 
	has_many :needs, through: :center_needs
	has_secure_password

	VALID_EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\Z/i
 	validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
    def inform_newsfeed
    	Newsfeed.create(center_id: self.id,content: "A group with name "+self.name+" has been created")
    end


    def validate 
#		validates :password, presence: true, length: { minimum: 6 }
	end
end
