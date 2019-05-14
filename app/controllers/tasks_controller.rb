class TasksController < ApplicationController
  def index
    # va chercher toutes les instances de Task, seront affichées dans la view
    @tasks = Task.all
  end

  def show
    # va chercher l'instance à afficher par la view
    @task = Task.find(params[:id])
  end

  def new
    # On a besoin de créer une instance vide
    # pour la donner à la form qui en a besoin
    # pour se construire correctement et savoir
    # sous quel format renvoyer les infos
    @task = Task.new
  end

  def create
    # puts params[:task][:title]
    # créé une nouvelle tache avec les infos de la form
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit          # GET /tasks/:id/edit
    @task = Task.find(params[:id])
  end

  def update        # PATCH /tasks/:id
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy       # DELETE /tasks/:id
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
