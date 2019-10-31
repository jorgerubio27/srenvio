class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@srenvio\.com\z/,
    message: "must be a kodak.com account" }


  def self.to_csv(options = { })
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

  
  # def self.tux(users)
  #   attributes = %w{id}

  #   CSV.generate(headers: true) do |csv|
  #   csv << attributes

  #   users.each do |user|

  #     csv << user.attributes.map {*column_name}
  #     end
  #   end
  # end

end

