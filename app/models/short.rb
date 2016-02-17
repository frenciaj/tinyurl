class Short < ActiveRecord::Base
validates :tiny, uniqueness: true

end
