desc "This task adds trips to each active box (to be scheduled each month)"
task update_trips: :environment do
  puts "Updating trips..."
  Box.update_trips
  puts "done."
end