class ApplicationRecord < ActiveRecord::Base
  	self.abstract_class = true

	public
	def increment(attribute, by = 1)
        self[attribute] ||= 0
        self[attribute] += by
        self
    end
end
