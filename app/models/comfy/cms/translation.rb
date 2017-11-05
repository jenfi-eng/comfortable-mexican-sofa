class Comfy::Cms::Translation < ActiveRecord::Base
  self.table_name = "comfy_cms_translations"

  # -- Relationships -----------------------------------------------------------
  belongs_to :page
  belongs_to :layout

  # -- Callbacks ---------------------------------------------------------------
  before_validation :assign_layout

  # -- Validations -------------------------------------------------------------
  validates :label,
    presence:   true

  validates :locale,
    presence:   true,
    uniqueness: {scope: :page_id}

private

  def assign_layout
    self.layout ||= self.page.layout if self.page.present?
  end
end
