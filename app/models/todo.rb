class Todo < ActiveRecord::Base
  belongs_to :list
  validates :description, presence: true
  after_create :set_incomplete

  def remove_expired
    @todo = Todo.all
    @todo.each do |t|
      if (t.created_at + 7.days) < Time.now
        t.delete
      end
    end
  end

  private
  def set_incomplete
    self.update_attribute(:status, false)
  end
end