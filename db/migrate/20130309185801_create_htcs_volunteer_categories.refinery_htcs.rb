# This migration comes from refinery_htcs (originally 2)
class CreateHtcsVolunteerCategories < ActiveRecord::Migration

  def up
    create_table :refinery_htcs_volunteer_categories do |t|
      t.string :name
      t.integer :sequence
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-htcs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/htcs/volunteer_categories"})
    end

    drop_table :refinery_htcs_volunteer_categories

  end

end
