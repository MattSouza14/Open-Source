class CursosController < ApplicationController
  before_action :set_curso, only: [:show]

  def index
    set_meta_tags title: 'Rookie Coder Network - Cursos',
                  description: 'Cursos de programação ',
                  keywords: 'Aprendizado, Learning, Cursos, Courses, Java, FrontEnd, Backend, Python, Ruby, Javascript, Certificados, Online'
    @cursos = Curso.all
  end

  def show
    @aulas = @curso.aulas.order(:id)
  end

  private

  def set_curso
    @curso = Curso.find(params[:id])
  end
end
