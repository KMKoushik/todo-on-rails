class TodoController < ApplicationController

  # POST /:task_id/todo
  def create
    todoitem = Todoitem.new(todoitem_params)
    todoitem.task_id = params[:task_id]
    todoitem.is_completed = false
    task = get_task
    if task
      if todoitem.save
        render json: { message: todoitem }, status: :ok
      else
        render json: { message: 'Some error occured' }, status: :internal_server_error
      end
    else
      render json: { message: 'Task not found' }, status: :bad_request
    end
  end

  # PUT /:task_id/todo/:id
  def update
    task = get_task
    if task
      todoItem = Todoitem.find_by(id: params[:id], task_id: params[:task_id])
      if todoItem.update(todoitem_params)
        render json: { message: todoItem }, status: :ok
      else
        render json: { message: 'Some error occured' }, status: :internal_server_error
      end
    else
      render json: { message: 'Task not found' }, status: :bad_request
    end
  end

  def destroy
    task = get_task
    if task
      todoItem = Todoitem.find_by(id: params[:id], task_id: params[:task_id])
      if todoItem && todoItem.destroy
        render json: { message: todoItem }, status: :no_content
      else
        render json: { message: 'Some error occured' }, status: :internal_server_error
      end
    else
      render json: { message: 'Task not found' }, status: :bad_request
    end
  end

  private
  def todoitem_params
    params.permit(:todo, :is_completed, :task_id)
  end

  def get_task
    Task.find_by(user_id: current_user.id, id: params[:task_id])
  end
end
