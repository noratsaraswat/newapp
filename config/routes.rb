Educrasy::Application.routes.draw do
  resources :class_details

  get "teacher_lesson/add"
  get "teacher_lesson/remove"

  resources :roles

  get "admin_users/new"

  resources :developers

  resources :admin_people

  resources :choices

  resources :quests

  get "lesson_pages_questionnaire/index"

  get "lesson_pages_questionnaire/edit"

  get "lesson_pages_questionnaire/new"

  resources :content_infos

  resources :lessons

  resources :supports, :only => [:new, :create]

  get "contact/index"

  get "compleated/index"

  get "student_lesson_page/index"
  get "student_lesson_page/find"
  get "student_lesson_page/result"
  get "student_lesson_page/add"
  get "student_lesson_page/remove"
  get "student_lesson_page/lesson"
  get "student_lesson_page/nextlesson"
  get "student_lesson_page/prevlesson"
  get "student_lesson_page/teacherlesson"
  get "student_lesson_page/answers"
  get "student_lesson_page/performance"
   get "student_lesson_page/thanks"
 gets  "student_lesson_page/export"
  resources :student_details

  get "class_performance_page/index"

  get "teacher_lesson_details/index"
  get "teacher_lesson_details/add"
  get "teacher_lesson_details/remove"
  resources :teacher_lesson_details
  resources :teacher_details

  resources :questionnaires

  resources :lesson_pages

  resources :content_developers

  resources :students

  resources :teachers

  resources :administrators

  resources :homes

  devise_for :users

  devise_for :users
  resources :users, :has_one => :role
  resources :users do
       resources :role
  end
 resources :users do
       resources :role
  end
  resources :quests do
       resources :choices
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "homes#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
