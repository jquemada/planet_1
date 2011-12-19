class Site < ActiveRecord::Base
    belongs_to :type
    belongs_to :trip
    validates_presence_of :name, :message => "must be provided"
end
