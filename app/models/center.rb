class Center < ActiveRecord::Base
	#include Visible
	after_save :inform_newsfeed

	after_create :inform_newsfeed_at_create_or_confirmation

    after_create :inform_needs

    after_update :inform_newsfeed_at_create_or_confirmation, :if => :confirmed_changed?


	scope :slug, -> slug { where("slug = ?", slug)}

	has_many :tokens , :foreign_key => "center_id"
	has_many :center_keywords
	has_many :keywords, through: :center_keywords
	has_many :statuses

	mount_uploader :image, CenterImageUploader

  	before_create :create_slug

#	validates :password, length: { minimum: 6 }

	has_many :center_needs 
	has_many :needs, through: :center_needs

  	has_many :important_needs, -> { where "importance = ?", 3 }, through: :center_needs,
         :class_name => "Need", :source => :need
         
	has_secure_password

	VALID_EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\Z/i
 	validates :email, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

    def inform_newsfeed_at_create_or_confirmation
        if self.confirmed == false
            return
        end
    	
        Newsfeed.create(center_id: self.id,content: "Μία ομάδα με όνομα "+self.name+" μόλις δημιουργήθηκε")
    end

    def inform_newsfeed
        if self.confirmed == false
            return
        end
    	
        self.changed.each do |attri|
            string=name_in_newsfeed(attri)

    		#if (attri!='email' and attri!='password_digest' and attri!='updated_at' and attri!='created_at' and attri!='id')
            if string!=""
                if (attri=='latitude' or attri=='longitude')
                    Newsfeed.create(center_id: self.id,content: "Η ομάδα "+self.name+" μόλις ενημέρωσε τη διεύθυνσή της στο προφίλ της")
    		    else
                    Newsfeed.create(center_id: self.id,content: "Η ομάδα "+self.name+" μόλις ενημέρωσε "+string+" στο προφίλ της")
 
                end
            end		
    	end

    end
=begin
    def pass_validate
        if self.password_digest_changed?
            validates :password, length: { minimum: 6 } 
        end
    end  
=end

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
    def name_in_newsfeed(attri)
        case attri
        when "contact_email"
            return "το email επικοινωνίας της"
        when 'center_type'
            return "τον τύπο της ομάδας"
        when 'phone_number'
            return "το τηλέφωνο επικοινωνίας της"
        when 'address'
            return "τη διεύθυνσή της"
        when 'name'
            return "το όνομά της"
        when 'refugees_number'
            return "τον τρέχοντα αριθμό προσφύγων και μεταναστών που φιλοξενεί"
        else 
            return ""
        end
    end 

    def inform_needs
        Need.all.each do |need|
            CenterNeed.create(need_id: need.id, center_id: self.id)
        end
    end 
   
end
