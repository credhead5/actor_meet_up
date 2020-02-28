class Review < ApplicationRecord
  belongs_to :actor, class_name: "User"
  belongs_to :evaluator, class_name: "User" 

end
