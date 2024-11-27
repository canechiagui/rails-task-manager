class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task

  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    task = Task.create(task_params)
    @task.save

    redirect_to task_path(@restaurant)


  end


  def edit
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to task_path,  status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def current_task
    @task = Task.find(params[:id])
  end

end
