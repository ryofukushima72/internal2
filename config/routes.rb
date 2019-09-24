Rails.application.routes.draw do
  
  resources :approvals, only: [:index, :create, :destroy]
  resources :sales, only: [:index, :new, :create, :destroy]
#<<<<<<< HEAD
  resources :reports
#=======
  #devise_for :users
  get 'home/index'
  get 'projects' => 'projects#index'
  get 'home/show'
  root to: "home#index"
#>>>>>>> temp2-devise
  resources :file_uploads
  resources :projects
  #resources :users     
  #root 'read#read'
  
  get 'recordtime' => 'recordtime#index', as: :recordtime
  get 'recordholiday' => 'recordholiday#index', as: :recordholiday
  get 'recordholiday/new' => 'recordholiday#new', as: :new_recordholiday
  post 'recordholiday/create' => 'recordholiday#create'
  get 'recordtime/:id/useredit' => 'recordtime#useredit'
  patch 'recordtime/:id/userupdate' => 'recordtime#userupdate'

  get 'read/read' => 'read#read2'
  get 'read/read2' => 'read#read'
  get 'read/read3' => 'read#read3'
  get 'read/read4' => 'read#read4'
  get 'read/read5' => 'read#read5'
  get 'recordtime/create'
  get 'recordtime/recordcreate'
  get 'recordtime/edit', as: :edit_recordtime
  get 'recordtime/:id/recordedit' => 'recordtime#recordedit', as: :editrecord
  patch 'recordtime/:id/recordupdate' => 'recordtime#recordupdate'

  get 'select/select'
  get 'insert/insert'
  get 'delete/delete'
  get 'update/edit'
  get 'update/update'
  get 'sales/salecommit'
  get 'approvals/approvalscommit'
  get 'sales/update'
#  get 'users/sign_in'

  get 'extra/mailcreate'
  post 'extra/mailconfirm'
  get 'extra/mailconfirm'  
  get 'extra/sendmail'
  post 'extra/sendmail'
  get 'extra/mailpdf'

  get 'cost/cost'   
  post  'read/upload_process'

  devise_for :users, :controllers => {
          :registrations => 'users/registrations',
          :sessions => 'users/sessions'
  }

  devise_scope :user do
      get "sign_in", :to => "users/sessions#new"
      get "sign_out", :to => "users/sessions#destroy"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
