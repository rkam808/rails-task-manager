Rails.application.routes.draw do
  # Create
  get '/tasks/new', to: 'tasks#new', as: :new_task
  post 'tasks', to: 'tasks#create', as: :tasks

  # Read
  get '/tasks', to: 'tasks#index'
  get '/tasks/:id', to: 'tasks#show', as: :task

  # Update
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch '/tasks/:id', to: 'tasks#update'

  # Delete

end
