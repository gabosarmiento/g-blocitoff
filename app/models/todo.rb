class Todo < ActiveRecord::Base
  belongs_to :list
  validates :description, presence: true
  after_create :set_incomplete

  private
  def set_incomplete
    self.update_attribute(:status, false)
  end
end