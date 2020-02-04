class TasksController < ApplicationController

  # GET
  def index
    tasks = Task.where(user_id: current_user.id)
    render json: { message: tasks }, status: :ok
  end

  # POST
  def create
    task = current_user.tasks.new(task_params)
    if task.save
      render json: { message: task }, status: :ok
    else
      render json: { message: 'Something went wrong' }, status: :internal_server_error
    end
  end

  # GET /:id
  def show
    task = get_task
    if task
      todoItems = get_todo_items
      response = { name: task[:name], todoItems: todoItems ? todoItems : [] }
      render json: { message: response }, status: :ok
    else
      render json: { message: 'Task not found'}, status: :not_found
    end
  end

  # DELETE /:id
  def destroy
    task = get_task
    if task.destroy
      render json: { message: 'Task deleted' }, status: :no_content
    else
      render json: { message: 'Something went wrong' }, status: :internal_server_error
    end
  end

  # put /:id
  def update
    task = get_task
    task.update(task_params)
    render json: { message: task }, status: :ok
  end

  private
  def task_params
    params.permit(:name)
  end

  def get_task
    Task.find_by(user_id: current_user.id, id: params[:id])
  end

  def get_todo_items
    Todoitem.where(task_id: params[:id])
  end
end
