class Meeting < ApplicationRecord
  belongs_to :seeker, class_name: "User"
  belongs_to :fulfiller, class_name: "User"
end
