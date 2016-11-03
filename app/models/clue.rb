class Clue < ActiveRecord::Base
  attr_accessible :airdate, :answer, :question, :value, :category_id, :category
  belongs_to :category, :counter_cache => true

  scope :valid, -> { where(<<-SQL
        "clues"."invalid_count" IS NULL OR "clues"."invalid_count" = 0
      SQL
    ).where('"clues"."value" IS NOT NULL')
  }

  def to_json(options={})
     options[:except] ||= [:updated_at, :created_at]
     super(options)
  end
end
