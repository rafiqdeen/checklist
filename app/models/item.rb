class Item < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 5 }

  def completed?
    !completed_at.blank?
  end

  def incompleted?
    completed_at.blank?
  end
end
