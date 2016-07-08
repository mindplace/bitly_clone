class Url < ActiveRecord::Base
  validates :body, presence: true
  validates :body, format: { with: URI.regexp }

  before_create :generate_short, if: :no_short_exists?

  def errors_as_string
    self.errors.full_messages.join("; ")
  end

  private

  def no_short_exists?
    self.short.nil?
  end

  def generate_short
    self.short = SecureRandom.hex(3)

    while Url.exists?(short: self.short)
      self.short = SecureRandom.hex(3)
    end
  end
end
