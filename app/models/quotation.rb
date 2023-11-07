class Quotation < ApplicationRecord
  has_many :quotation_items, dependent: :destroy
  belongs_to :car_form
  accepts_nested_attributes_for :quotation_items, reject_if: :all_blank, allow_destroy: true
  has_many :comments, as: :commentable

  def approved?
    self.approved_by_customer?
  end
end
