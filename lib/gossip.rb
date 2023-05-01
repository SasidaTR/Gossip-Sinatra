class Gossip
  attr_accessor :author
  attr_accessor :content

  def initialize(author_to_save, content_to_save)
    @author = author_to_save
    @content = content_to_save
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    all_gossips = CSV.read("db/gossip.csv")
    selected_gossip = all_gossips[id.to_i-1]
    return Gossip.new(selected_gossip[0], selected_gossip[1])
  end
end