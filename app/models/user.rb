class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  validates :username, uniqueness: true

  has_many :seeker_meetings, class_name: "Meeting", foreign_key: "fulfiller_id", dependent: :destroy

  has_many :seekers, through: :seeker_meetings, source: :seeker

  has_many :fulfiller_meetings, class_name: "Meeting", foreign_key: "seeker_id", dependent: :destroy

  has_many :fulfillers, through: :fulfiller_meetings, source: :fulfiller

  has_many :evaluator_reviews, class_name: "Review", foreign_key: "actor_id", dependent: :destroy

  has_many :evaluators, through: :evaluator_reviews, source: :evaluator

  has_many :actor_reviews, class_name: "Review", foreign_key: "evaluator_id", dependent: :destroy
  
  has_many :actors, through: :actor_reviews,source: :actor

  def meetings
    seeker_meetings + fulfiller_meetings
  end

end


