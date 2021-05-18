class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new.html.erb'
    end
  end

  def edit
  end

  def update
    task_params["completed"] == '1' ? @task[:completed] = true : @task[:completed] = false
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render 'edit.html.erb'
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
