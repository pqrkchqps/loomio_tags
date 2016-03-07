module Plugins
  module LoomioTags
    class Plugin < Plugins::Base
      setup! :loomio_tags do |plugin|
        plugin.enabled = true

        plugin.use_database_table :tags do |table|
          table.belongs_to :group
          table.string :name
          table.string :color
          table.timestamps
        end
        plugin.use_class 'models/tag'

        plugin.use_database_table :discussion_tags do |table|
          table.belongs_to :tag
          table.belongs_to :discussion
          table.timestamps
        end
        plugin.use_class 'models/discussion_tag'

        plugin.extend_class Discussion do
          has_many :discussion_tags, dependent: :destroy
          has_many :tags, through: :discussion_tags
        end
        plugin.extend_class Group do
          has_many :tags
        end
      end
    end
  end
end
