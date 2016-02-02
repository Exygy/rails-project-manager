desc 'This task will remove all tasks that are marked as :status "Finished", and are older than three months'
task :delete_old_finished_tasks => :environment do
  puts 'Removing old completed project tasks...'
  Task.where(status: 2).where('updated_at < ?', 1.week.ago).delete_all
  puts 'done.'
end