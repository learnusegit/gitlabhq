class ProjectWebHookWorker
  include Sidekiq::Worker
  include DedicatedSidekiqQueue

  def perform(hook_id, data, hook_name)
    data = data.with_indifferent_access
    WebHook.find(hook_id).execute(data, hook_name)
  end
end
