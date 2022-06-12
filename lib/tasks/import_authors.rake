namespace :import_authors do
  include Sidekiq::Worker
  desc 'Import Files'
  require 'csv'
  require 'open-uri'
  task :create_authors, [:file] => [:environment] do |t, file|

    BATCH_SIZE = 1000
    @bulk_enqueue_options = []
    csv_filepath  = file[:file]
    batch.jobs do
      CSV.foreach(csv_filepath, headers: true) do |row|
        @bulk_enqueue_options << row
        bulk_enqueue_current_batch if @bulk_enqueue_options.length > BATCH_SIZE
      end
      bulk_enqueue_current_batch
    end

    rescue StandardError
    batch.invalidate_all
    raise
  end

  def batch
    @batch ||= Sidekiq::Batch.new
  end

  def bulk_enqueue_current_batch
    Sidekiq::Client.push_bulk({ 'class' => CreateAuthor, 'args' => @bulk_enqueue_options })
    @bulk_enqueue_options = []
  end

end

 
