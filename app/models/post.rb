class Post < ApplicationRecord
  enum category: {
    world: 1,
    business: 2,
    tech: 3,
    sport: 4
  }
end
