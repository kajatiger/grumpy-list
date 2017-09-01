# name: grumpy-list
# about: A sample plugin showing how to add a plugin route
# version: 0.1
# authors: Kaja
# url: https://github.com/kajatiger/grumpy-list

add_admin_route 'grumpy_list.title', 'grumpy-list'

Discourse::Application.routes.append do
  get '/admin/plugins/grumpy-list' => 'admin/plugins#index'
end

# GEMS
gem 'domain_name', '0.5.20170404', { require: false }
gem 'http-cookie', '1.0.3', { require: false }
gem 'hashie', '3.5.5', { require: false }
gem 'multi_json', '1.12.1', { require: false }
gem 'net_dav', '0.5.1', { require: false }
gem 'netrc', '0.8.0', { require: false }
gem 'rest-client', '2.0.2', { require: false }
gem 'ocman', '1.2.2'
require 'sidekiq'


enabled_site_setting :grumpy_list_enabled

after_initialize do
  load File.expand_path("../config/initializers/ocman.rb", __FILE__)
  load File.expand_path("../app/jobs/regular/sync_backups_to_nextcloud.rb", __FILE__)
  load File.expand_path("../app/jobs/regular/send_download_next_link.rb", __FILE__)
  load File.expand_path("../lib/nextcloud_synchronizer.rb", __FILE__)
  load File.expand_path("../lib/next_downloader.rb", __FILE__)
  load File.expand_path("../app/controllers/downloaders_controller.rb", __FILE__)

  DiscourseEvent.on(:backup_created)do
    Jobs.enqueue(:sync_backups_to_nextcloud)
  end