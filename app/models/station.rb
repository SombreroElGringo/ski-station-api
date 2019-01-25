class Station < ApplicationRecord
  serialize :styles, Array
  serialize :contact
  serialize :domains
  serialize :snowfall
  serialize :open_domains
  serialize :ski_pass
  serialize :weather
end
