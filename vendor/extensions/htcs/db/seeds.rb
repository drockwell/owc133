(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-htcs').blank?
        user.plugins.create(:name => 'refinerycms-htcs',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/htcs"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Htcs',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end
(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-volunteer_categories').blank?
        user.plugins.create(:name => 'refinerycms-volunteer_categories',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/volunteer_categories"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Volunteer Categories',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end

# Populate default list of Volunteer Categories

Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Patient & Family Care")
Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Bereavement")
Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Administrative Support")
Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Needlework")
Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Vigil")
Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Pet Therapy")
Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Speakers Bureau")
Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Massage Therapy")
Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Holiday Lights and Limos")