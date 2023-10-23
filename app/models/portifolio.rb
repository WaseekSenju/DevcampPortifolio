class Portifolio < ApplicationRecord
    has_many :technologies
    include PlaceHolder
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.flutter
        where(subtitle: 'Flutter')
    end

    scope :ruby_on_rails_portifolio_items, -> { where(subtitle: 'Ruby on rails')}

    after_initialize :set_defautls

    def set_defautls
        self.main_image   ||=  PlaceHolder.image_generator(height: '600', width: '400')
        self.thumb_image  ||=  PlaceHolder.image_generator(height: '350', width: '200')
    end
end
