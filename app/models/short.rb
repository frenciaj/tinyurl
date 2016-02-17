class Short < ActiveRecord::Base

def self.shorten_url
  @short.tiny = @short.to_i(36)
end

end
