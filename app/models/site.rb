class Site < ActiveRecord::Base
    belongs_to :type
    has_attached_file :image
end
