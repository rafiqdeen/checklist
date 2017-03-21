class Item < ActiveRecord::Base

  def completed?
    !completed_at.blank?
  end

  def incompleted?
    completed_at.blank?
  end
end
