Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {:registrations => "registrations"}
  scope 'admin' do
    
    resources :logos, :path => 'configuracoes'
    resources :news, :path => 'roteiros'
    resources :editions, :path => 'translados'
    resources :slides , :path => 'slides'
    resources :directors, :path => 'atividades'
    
  end
  root 'pages#index'
  get 'home' => "pages#home", as: :home
  get 'roteiros' => "pages#noticias", as: :noticias
  get "roteiro/:id", to: "pages#noticia", as: :noticia
  get 'translados' => "pages#edicoes", as: :edicoes
  get "translado/:id", to: "pages#edicao", as: :edicao
  get "comofunciona" => "pages#ofestival", as: :ofestival
  get "contato" => "pages#contato", as: :contact

end