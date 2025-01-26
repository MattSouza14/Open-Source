class AulasController < ApplicationController
  before_action :set_curso
  before_action :set_aula, only: [:show, :update]

  def show
    # Define a próxima aula
    @next_aula = @curso.aulas.where("id > ?", @aula.id).order(:id).first
  end

  def update
    @aula.update(liberada: true)
    redirect_to curso_aula_path(@curso, @aula), notice: "Aula liberada!"
  end

  private

  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  def set_aula
    @aula = @curso.aulas.find(params[:id])
  end
end
