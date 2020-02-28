class User < ApplicationRecord
  has_many :seeker_meetings, class_name: "Meeting", foreign_key: "fulfiller_id"

  has_many :seekers, through: :seeker_meetings, source: :seeker

  has_many :fulfiller_meetings, class_name: "Meeting", foreign_key: "seeker_id"

  has_many :fulfillers, through: :fulfiller_meetings, source: :fulfiller

  has_many :evaluator_reviews, class_name: "Review", foreign_key: "actor_id"

  has_many :evaluators, through: :evaluator_reviews, source: :evaluator

  has_many :actor_reviews, class_name: "Review", foreign_key: "evaluator_id"
  
  has_many :actors, through: :actor_reviews,source: :actor
end


