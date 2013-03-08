class RenameAboutToHomepage < ActiveRecord::Migration
  def up
    page = Page.find_by_slug!("about")
    page.update_attributes(slug: "homepage", title: "Homepage")
  end

  def down
    page = Page.find_by_slug!("homepage")
    page.update_attributes(slug: "about", title: "About")
  end
end
