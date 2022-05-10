module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = %w(public private closed deleted)

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
    def private_count
      where(status: 'private').count
    end
    def closed_count
      where(status: 'closed').count
    end
    def deleted_count
      where(status: 'deleted').count
    end
  end

  def closed?
    status == 'closed'
  end

  def deleted?
    status == 'deleted'
  end

  def hasACommenter?
    if self.commenter != ""
      self.commenter
        else
      'Anonymous'
    end
  end
end
