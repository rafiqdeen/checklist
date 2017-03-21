class Item < ActiveRecord::Base
  validates :title, presence: true,
            length: { minimum: 5 }

  def completed?
    !completed_at.blank?
  end

  def incompleted?
    completed_at.blank?
  end
end
