class Contact < ApplicationRecord
  has_paper_trail
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cellphone, :email, :birthdate, presence: true
  validates :gender, presence: true

  scope :count_all_males, -> {where(gender: "M").count}
  scope :count_all_females, -> {where(gender: "F").count}
  scope :by_gender, -> (g) {where(gender: g).count}

  belongs_to :user

  enum gender: {
    male: "M",
    female: "F"
  }

end
