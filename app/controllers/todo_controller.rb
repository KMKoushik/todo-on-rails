class TodoController < ApplicationController

  # POST /:task_id/todo
  def create
    todoitem = get_task.todoitems.new(todoitem_params)
    todoitem.is_completed = false
    if todoitem.save
      render json: { message: todoitem }, status: :ok
    else
      render json: { message: 'Some error occured' }, status: :internal_server_error
    end
  end

  # PUT /:task_id/todo/:id
  def update
    todoItem = get_task.todoitems.find_by(id: params[:id])

    if todoItem.update(todoitem_params)
      render json: { message: todoItem }, status: :ok
    else
      render json: { message: 'Some error occured' }, status: :internal_server_error
    end
  end

  def destroy
    todoItem = get_task.todoitems.find_by(id: params[:id])
    if todoItem && todoItem.destroy
      render json: { message: todoItem }, status: :no_content
    else
      render json: { message: 'Some error occured' }, status: :internal_server_error
    end
  end

  private
  def todoitem_params
    params.permit(:todo, :is_completed, :task_id)
  end

  def get_task
    current_user.tasks.find_by(id: params[:task_id])
  end
end
