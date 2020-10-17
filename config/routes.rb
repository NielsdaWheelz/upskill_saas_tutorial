Rails.application.routes.draw do
    root to: 'pages#home' #root (the home, index) needs to point to the pages controller (pages_controller) and then to the 'home' method/function
    get 'about', to: 'pages#about'
    resources :contacts, only: :create #this creates a bunch of relevant URLs for us, like create, edit, delete, etc. around 'contacts' object (see 'rails routes' in console). "only: [:new, :create]" to select a subset
    get 'contact-us', to: 'contacts#new', as: 'new_contact' #when 'contact-us' happens, read the 'contacts' controller and run the 'new' function. Rename the path name (see 'rails routes' in console) as "new_contact" for reference in e.g. links to the page
end
