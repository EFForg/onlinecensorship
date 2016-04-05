Rails.application.routes.draw do

  resources :notifications

  resources :stories do
    put :publish
  end

  resources :posts_themes
  resources :home_fields

  resources :quotes do
    put :featured
  end

  get "/submit-report" => "social_media_platforms#submit_report", :as => "submit_report"
  get "/submit-report/:id" => "social_media_platforms#submit_report_show", :as => "submit_report_show"

  resources :subscribes
  get "/subscribe_confirmation" => "subscribes#subscribe_confirmation"

  resources :people

  resources :contacts , except: :index
  get "/contacts" => "contacts#new"

  resources :contacts_topics
  resources :pages_questions
  resources :question_user_submissions
  resources :further_reads

  get "resources/further-readings" => "further_reads#index"

  resources :faqs

  get "about/faqs" => "faqs#index"

  resources :content_management_pages
  resources :question_answers
  resources :question_options
  resources :languages
  resources :countries
  resources :question_users
  resources :questions
  resources :pages
  resources :social_media_platforms

  resources :posts, path: 'news-and-analysis' do
    put :publish
    put :featured
    put :pinned
    collection do
      get :preview
    end
  end
  get "/author/:id" => "posts#author", :as => "author"

  resources :categories

  devise_for :users, :skip => [:registrations]                                        
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    put 'users' => 'devise/registrations#update', :as => 'user_registration'            
  end

  # for home page
  root 'home#index'
  post "/thanks" => "questions#submit"
  get '/ty' => 'questions#ty'

  # for cms pages
  get "about/who-we-are" => "content_management_pages#who_we_are"
  get "about/what-we-do" => "content_management_pages#what_we_do"
  get "resources/how-to-appeal" => "content_management_pages#appeal"
  get "privacy-policy" => "content_management_pages#privacy"

  # for backend ######
  get "/admin", :to => redirect("/users/sign_in")
  get "/admin/dashboard" => "home#dashboard"

  get "/admin/countries" => "countries#index"
  get "/admin/languages" => "languages#index"
  get "/admin/social_media_platforms" => "social_media_platforms#index"
  get "/admin/pages_questions" => "pages#pages_questions"
  post "/admin/update_page" =>"pages#update_page"
  get "/admin/questions" => "questions#index"
  get "/admin/related_questions" => "questions#related_questions"
  get "/admin/related_options" => "questions#related_options"
  get "/admin/question_users" => "question_users#index"

  get "/admin/people" => "people#index"
  get "/admin/content_management_pages" => "content_management_pages#index"
  get "/admin/home_fields" => "home_fields#admin"
  get "/admin/categories" => "categories#index"
  get "/admin/posts_themes" => "posts_themes#index"
  get "/admin/quotes" => "quotes#index"
  get "/admin/posts" => "posts#admin"
  get "/admin/further_reads" => "further_reads#admin"
  get "/admin/stories" => "stories#index"
  get "/admin/faqs" => "faqs#admin"
  get "/admin/subscribes" => "subscribes#index"
  get "/admin/contacts_topics" => "contacts_topics#index"
  get "/admin/contacts" => "contacts#index"
  get "/admin/notifications" => "notifications#index"


  # for errors
  match "/404" =>  "home#error", via: [ :get, :post, :patch, :delete ]
  match "/500" =>  "home#error", via: [ :get, :post, :patch, :delete ]
  match "/422" =>  "home#error", via: [ :get, :post, :patch, :delete ]
  match "*path" => "home#error", via: [ :get, :post, :patch, :delete ]
end
