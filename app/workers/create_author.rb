class CreateAuthor
  include Sidekiq::Worker

  def perform(name)
    Author.create!(name: name)
  end
end

