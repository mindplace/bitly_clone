class Url < ActiveRecord::Base
  validates :body, presence: true
  validate :body_format

  def body_format
    unless body.match(/^(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$/)
      self.errors[:body].push("Incorrect URL format")
    end
  end

  def errors_as_string
    self.errors.full_messages.join("; ")
  end
end
