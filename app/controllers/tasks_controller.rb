class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def show
        task_id = params[:id].to_i
        if Task.find_by(id: task_id)
            @task = Task.find_by(id: task_id)
        else
            redirect_to tasks_path
        end
    end

    def new
        @task = Task.new
        @task.task_name = "Get Stuff Done"
    end

    def create
        @task = Task.new(task_name: params[:task][:task_name], description: params[:task][:description],due_date: params[:task][:due_date] ) #instantiate a new book
        if @task.save # save returns true if the database insert succeeds
            redirect_to tasks_path # go to the index so we can see the book in the list
        else # save failed :(
            redirect_to new_task_path # show the new book form view again
        end
      end

end
