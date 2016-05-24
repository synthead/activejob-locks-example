class LockedJob < ActiveJob::Base
  # ttl:  Time for lock to be valid.  This allows for the process to completely disappear and not lock every job forever.  This should be set based on some reasonable time the jobs take to finish.  Default: 1 minute
  # requeue_wait:  How long to wait before retrying the job.  Default: Now
  lock_by :payload, ttl: 50.seconds, requeue_wait: 3.seconds
  # or
  # lock_by :queue, ttl: 20.seconds, requeue_wait: 3.seconds

  def perform(payload)
    sleep 15
    puts "awesome #{payload}"
  end
end