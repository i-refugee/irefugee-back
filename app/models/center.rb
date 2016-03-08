class Center < ActiveRecord::Base
	#include Visible
	after_save :inform_newsfeed

	scope :slug, -> slug { where("slug = ?", slug)}

	has_many :tokens , :foreign_key => "center_id"
	has_many :center_keywords
	has_many :keywords, through: :center_keywords
	has_many :statuses

	mount_uploader :image, CenterImageUploader

	before_create :validate
  	before_create :create_slug

	has_many :center_needs 
	has_many :needs, through: :center_needs

  	has_many :important_needs, -> { where "importance = ?", 2 }, through: :center_needs,
         :class_name => "Need", :source => :need
         
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

	# after create prepei na dijmiourgoume ta needs
	# an den exei onoma exume provlima
  def create_slug
    slug = (self.name).downcase
    # remove whitespace at start or end and replace the ones in the middle with dots
    slug = slug.rstrip 
    slug = slug.lstrip 
    slug = slug.gsub(' ','.')
    if Center.find_by(slug: slug)
      # add something
      slug = slug + '.'
      while true do 
        slug_l = slug + Faker::Color.hex_color
        if !Center.find_by(slug: slug)
          self.slug = slug_l
          break
        end
      end
    else
      self.slug = slug
    end
  end
end
