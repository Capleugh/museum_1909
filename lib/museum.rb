class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      # require "pry"; binding.pry
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end



  def patrons_by_exhibit_interest
    # want exhibit objects as keys and patron objects with interests in said exhibits in an array as values

    exhibit_obj = @exhibits.reduce({}) do |name, exhibit|
      name[exhibit] = exhibit.name
      name
    end

    interests = @patrons.reduce({}) do |interest, patron|
      if patron.interests.include?(exhibit.name)
        interest[patron] = [patron.name]
        interest
      end
    end

    exhibit_obj.merge(interests) do |exhibit, name, patron|
      patron.interests
    end

    # I realize this is a huge mess and that I'm pretty sure I totally off track in terms of what to do here. I would love some feedback!
  end

end
