desc "Import new deeplinks blog posts"
task import_deeplinks: :environment do
  ImportDeeplinksJob.perform_now
end
