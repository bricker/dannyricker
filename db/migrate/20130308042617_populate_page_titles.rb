class PopulatePageTitles < ActiveRecord::Migration
  def up
    Page.all.each do |page|
      page.update_attribute(:title, page.slug.titleize)
    end
  end

  def down
    Page.all.each do |page|
      page.update_attribute :title, nil
    end
  end
end
