class Url < ActiveRecord::Base
  validates :body, presence: true
  validates :body, format: { with: URI.regexp }

  before_create :generate_short, :generate_complete_short

  def errors_as_string
    self.errors.full_messages.join("; ")
  end

  private

  def generate_short
    self.short = SecureRandom.hex(3)

    while Url.exists?(short: self.short)
      self.short = SecureRandom.hex(3)
    end
  end

  def generate_complete_short
    self.complete_short = "#{self.base_url}/#{short}"
  end
end
