Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {:registrations => "registrations"}
  scope 'admin' do
    
    resources :editals, :path => 'editais'
    resources :news, :path => 'noticias'
    resources :editions, :path => 'edicoes'
    resources :slides , :path => 'slides'
    resources :directors, :path => 'realizadores'
    resources :sponsors, :path => 'patrocinadores'
    resources :events, :path => 'programacao'
    resources :midia, :path => 'midia'
    resources :categories, :path =>'categorias'
    resources :logos, :path => 'logos'
    resources :eventos,  :path => 'eventosjm'
    resources :colaborators, :path => 'colaboradores'
    resources :feiras, :path => 'feiras'
    resources :conections,:path => 'conexao'
    resources :oficinas,:path => 'oficinas'
	end
	root 'pages#index'
	get 'home' => "pages#home", as: :home
	get 'ofestival' => "pages#ofestival", as: :ofestival
  get 'noticias' => "pages#noticias", as: :noticias
  get 'noticias_anteriores' => "pages#noticias_anteriores", as: :noticias_anteriores
  get "noticia/:id", to: "pages#noticia", as: :noticia
  get 'edicoes' => "pages#edicoes", as: :edicoes
  get "edicao/:id", to: "pages#edicao", as: :edicao
  get 'editais' => "pages#editais", as: :editais
  get 'editais_sel' => "pages#editais_selecao", as: :editais_sel
  get "edital/:id", to: "pages#edital", as: :edit
  get 'evento/admin', to: "events#progadmin"
  get '/contato', to: "pages#contato"
  get '/edit-logo', to: 'pages#logo'
  get '/contato', to: 'pages#contato'
  get 'eventos', to: "pages#eventos", as: :eventos_
  get 'evento/:id', to: "pages#evento", as: :evento_
  get 'eventosjm', to: "pages#eventosjm", as: :eventosjm
  get 'eventojm/:id', to: "pages#eventojm", as: :eventojm
  get 'midias', to: "pages#midia", as: :midias
  get 'colaboradores' => "pages#colaboradores", as: :colaboradorespag
  get 'feiras' => "pages#feiras", as: :exposicoesefeiras
  get 'conexao' => "pages#conexao", as: :conexaofestival

  get 'iniciooficinas', to: "pages#oficinas", as: :oficinasinicial
  get 'oficina/:id', to: "pages#oficina", as: :oficinapag

  get 'oficina/:id/inscricao' => 'pages#inscricao'
  post 'oficina/:id/pagamento' => 'pages#pagamento'

end