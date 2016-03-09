class Center < ActiveRecord::Base
	#include Visible
	after_save :inform_newsfeed
	after_create :inform_newsfeed_at_create
    after_create :inform_needs


	has_many :tokens , :foreign_key => "center_id"
	has_many :center_keywords
	has_many :keywords, through: :center_keywords
	has_many :statuses

	mount_uploader :image, CenterImageUploader

	validates :password, length: { minimum: 6 }
	has_many :center_needs 
	has_many :needs, through: :center_needs

  	has_many :important_needs, -> { where "importance = ?", 2 }, through: :center_needs,
         :class_name => "Need", :source => :need
         
	has_secure_password

	VALID_EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\Z/i
 	validates :email, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
    def inform_newsfeed_at_create
    	Newsfeed.create(center_id: self.id,content: "Μία ομάδα με όνομα "+self.name+" μόλις δημιουργήθηκε")
    end

    def inform_newsfeed
    	
    	self.changed.each do |attri|
    		puts attri
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
        needs=Need.all
        for need in needs
            self.needs << need
        end
    end 
   
end
