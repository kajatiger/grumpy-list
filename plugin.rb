# name: grumpy-list
# about: A sample plugin showing how to add a plugin route
# version: 0.1
# authors: Kaja
# url: https://github.com/kajatiger/grumpy-list

add_admin_route 'grumpy_list.title', 'grumpy-list'

Discourse::Application.routes.append do
  get '/admin/plugins/grumpy-list' => 'admin/plugins#index'
end
