class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    find_task
  end

  def new
    @new_task = Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], done: false)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    find_task
  end

  def update
    find_task
    @task.update(name: params[:task][:name], description: params[:task][:description], done: false || true)
    @task.save
    redirect_to task_path
  end

  def destroy
    find_task
    @task.delete
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end
end
