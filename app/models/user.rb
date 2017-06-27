class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role_id: {
    admin: 1,
    user: 2,
    dumb: 3
  }

  has_many :contacts

  def self.role_ids_i18n
    role_ids.map do |key, value|
      [I18n.t("enums.#{model_name.i18n_key}.role_id.#{key}"), key]
    end
  end

  def admin?
    role_id == "admin"
  end

  def user?
    role_id == "user"
  end

  def dumb?
    role_id == "dumb"
  end
end
