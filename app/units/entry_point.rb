module EntryPoint
  extend ActiveSupport::Concern

  def call
    return nil unless entity.valid?

    entity.save!
    action.call

    entity
  end

  included do
    attr_accessor :entity, :action
  end

  class_methods do
    def call(*args)
      new(*args).call
    end
  end

end