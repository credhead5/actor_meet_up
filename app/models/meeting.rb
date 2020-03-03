class Meeting < ApplicationRecord
  belongs_to :seeker, class_name: "User"
  belongs_to :fulfiller, class_name: "User"

  def time_updated_at
    start_time.strftime("%A, %d %b %Y %l:%M %p")
  
  end
end
