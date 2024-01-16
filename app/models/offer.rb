class Offer < ApplicationRecord
  serialize :images, Array
  serialize :options, Array
end
