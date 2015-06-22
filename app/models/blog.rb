class Blog < ActiveRecord::Base
  belongs_to :user
  # enforce the descending order by created_at of blogs
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title,   presence:true,
                      length: { maximum: 255 }
end
