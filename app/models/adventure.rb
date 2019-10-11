class Adventure < ActiveRecord::Base
    belongs_to :user

    validates :title, :location, presence: true

    # def slug
    #     self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    # end

    # def self.find_by_slug(slug)
    #     self.all.find {|adv| adv.slug == slug}
    # end

end