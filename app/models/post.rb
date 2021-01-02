class Post < ApplicationRecord
    validates :start_day, presence: true
    validates :finish_day, presence: true
    validates :title, presence: true
    
    def self.sort(selection)
        case selection
            when 'id_asc'
                return all.order(id: :ASC)
            when 'id_desc'
                return all.order(id: :DESC)
            when 'start_day_close'
                return all.order(start_day: :ASC)
            when 'start_day_far'
                return all.order(start_day: :DESC)
        end
    end
end
