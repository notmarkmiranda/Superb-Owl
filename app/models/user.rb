class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_many :pools

  def generate_code
    update(confirmation_code: random_code, confirmation_expiration: 15.minutes.from_now)
  end

  def confirm?(code)
    return false unless confirmation_code && confirmation_expiration
    code.upcase == confirmation_code.upcase && Time.current < confirmation_expiration
  end

  def names_complete?
    (first_name.present? && last_name.present?) || nickname.present?
  end

  private

  def random_code
    (0...5).map { rand(65..90).chr }.join
  end
end
