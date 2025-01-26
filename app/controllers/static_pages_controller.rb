class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: :home
  def home
    set_meta_tags title: 'Rookie Coder Network',
                  description: 'Descubra como iniciar ou avançar na sua jornada como desenvolvedor com nossos cursos práticos e acessíveis. 
                  Oferecemos conteúdos atualizados em Ruby, JavaScript, Python e outras tecnologias essenciais, capacitando iniciantes 
                  e entusiastas da programação a conquistarem seus objetivos na área de tecnologia.',
                  keywords: 'Rookie Coder Network,Programação, Codigos, Cursos TI, Tecnologia, Aprendizado, Certificados, Cursos online,cursos de programação para iniciantes'
    @active_nav_item = 'home'
  end
  def courses
    
    @active_nav_item = 'courses'
  end
  def about
    set_meta_tags title: '',
                  description: '',
                  keywords: ''
    @active_nav_item = 'about'
  end
end
