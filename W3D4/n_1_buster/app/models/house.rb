class House < ActiveRecord::Base
  has_many(
    :gardeners,
    class_name: "Gardener",
    foreign_key: :house_id,
    primary_key: :id
  )

  has_many(
    :plants,
    through: :gardeners,
    source: :plants
  )

  def n_plus_one_seeds
    plants = self.plants
    # gives us a relation pointing to Plants table
    seeds = []
    plants.each do |plant|
      # for each plant, add the seeds...
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    # TODO:
    plants = self.plants.join(:all_seeds)
    seeds = []

    plants.each do |plant|
      seed << plants.seeds
    end
  end
end
