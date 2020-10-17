Rails.application.routes.draw do
    root to: 'pages#home' #root (the home, index) needs to point to the pages controller (pages_controller) and then to the 'home' method/function
    get 'about', to: 'pages#about'
    resources :contacts
    get 'contact-us', to: 'contacts#new'
end
