class QuizController < ApplicationController
  before_action :initialize_quiz_session, only: :question

  QUESTIONS = [
    {
      question: 'O que mais chama sua atenção ao pensar em desenvolvimento de software?',
      options: ['Tornar a experiência do usuário intuitiva e visualmente atraente.', 'Garantir que os dados sejam processados de forma segura e eficiente.', 'Descobrir padrões e informações valiosas em conjuntos de dados complexos.', 'Criar aplicativos que funcionem perfeitamente em smartphones e tablets.', 'Desenvolver jogos interativos e envolventes.', 'Trabalhar em todas as partes do desenvolvimento de software, da interface ao servidor.']
    },
    {
      question: 'O que te motiva mais ao pensar em criar algo novo?',
      options: ['Aperfeiçoar a estética e a usabilidade de interfaces de usuário.','Desenvolver a lógica que permite aplicações processarem dados de forma eficaz.','Analisar grandes conjuntos de dados para extrair informações valiosas.','Criar aplicativos que ofereçam ótima experiência em dispositivos móveis.','Desenvolver jogos que cativem os jogadores com gráficos e jogabilidade envolventes.','Lidar com todos os aspectos do desenvolvimento de software, da concepção à implementação.']
    },
    {
      question: 'Qual destas atividades você acha mais empolgante ao criar algo digital?',
      options: ['Tornar a interface do usuário atraente e intuitiva.','Garantir que os dados sejam processados de forma segura e eficiente.','Encontrar padrões e insights valiosos em grandes conjuntos de dados.','Criar aplicativos que se integram perfeitamente aos sistemas operacionais móveis.','Desenvolver jogos interativos e envolventes.','Trabalhar em todas as partes do desenvolvimento de software, da interface ao servidor.']
    },
    {
      question: 'Quando você pensa em otimizar a eficiência de um aplicativo, qual aspecto você considera mais crucial?',
      options: ['Aprimorar a velocidade de carregamento e a fluidez da interface.','Otimizar consultas de banco de dados e processamento de dados no servidor.','Utilizar algoritmos eficientes para manipulação e análise de dados','Garantir que o aplicativo consuma poucos recursos e funcione sem problemas em dispositivos móveis.','Otimizar o desempenho gráfico e a jogabilidade em um ambiente de jogo.','Equilibrar a eficiência em todas as partes do desenvolvimento de software.']
    },
    {
      question: 'Qual dessas habilidades você acha mais desafiadora e, ao mesmo tempo, mais crucial para o sucesso de um projeto?',
      options: ['Dominar as últimas tendências em design de interfaces.','Arquitetar sistemas escaláveis e de alta performance.','Desenvolver algoritmos complexos para análise de dados avançada.','Adaptar aplicativos para uma variedade de dispositivos móveis e sistemas operacionais.','Criar gráficos e mecânicas de jogo envolventes e inovadoras.','Ter habilidades abrangentes para lidar com todos os aspectos do desenvolvimento de software.']
    }
  ].freeze

  AREAS = {
    "Tornar a experiência do usuário intuitiva e visualmente atraente." => :front_end,
    "Desenvolver a lógica que permite aplicações processarem dados de forma eficaz." => :front_end,
    "Tornar a interface do usuário atraente e intuitiva." => :front_end,
    "Aprimorar a velocidade de carregamento e a fluidez da interface." => :front_end,
    "Dominar as últimas tendências em design de interfaces." => :front_end,
    "Garantir que os dados sejam processados de forma segura e eficiente." => :back_end,
    "Desenvolver a lógica que permite aplicações processarem dados de forma eficaz." => :back_end,
    "Garantir que os dados sejam processados de forma segura e eficiente." => :back_end,
    "Otimizar consultas de banco de dados e processamento de dados no servidor." => :back_end,
    "Arquitetar sistemas escaláveis e de alta performance." => :back_end,
    "Descobrir padrões e informações valiosas em conjuntos de dados complexos." => :ciencia_dados,
    "Analisar grandes conjuntos de dados para extrair informações valiosas." => :ciencia_dados,
    "Encontrar padrões e insights valiosos em grandes conjuntos de dados." => :ciencia_dados,
    "Utilizar algoritmos eficientes para manipulação e análise de dados" => :ciencia_dados,
    "Desenvolver algoritmos complexos para análise de dados avançada." => :ciencia_dados,
    "Criar aplicativos que funcionem perfeitamente em smartphones e tablets." => :desenvolvimento_mobile,
    "Criar aplicativos que ofereçam ótima experiência em dispositivos móveis." => :desenvolvimento_mobile,
    "Criar aplicativos que se integram perfeitamente aos sistemas operacionais móveis." => :desenvolvimento_mobile,
    "Garantir que o aplicativo consuma poucos recursos e funcione sem problemas em dispositivos móveis." => :desenvolvimento_mobile,
    "Adaptar aplicativos para uma variedade de dispositivos móveis e sistemas operacionais." => :desenvolvimento_mobile,
    "Desenvolver jogos interativos e envolventes." => :desenvolvimento_jogos,
    "Desenvolver jogos que cativem os jogadores com gráficos e jogabilidade envolventes." => :desenvolvimento_jogos,
    "Desenvolver jogos interativos e envolventes." => :desenvolvimento_jogos,
    "Otimizar o desempenho gráfico e a jogabilidade em um ambiente de jogo." => :desenvolvimento_jogos,
    "Criar gráficos e mecânicas de jogo envolventes e inovadoras." => :desenvolvimento_jogos,
    "Trabalhar em todas as partes do desenvolvimento de software, da interface ao servidor." => :full_stack,
    "Lidar com todos os aspectos do desenvolvimento de software, da concepção à implementação." => :full_stack,
    "Trabalhar em todas as partes do desenvolvimento de software, da interface ao servidor." => :full_stack,
    "Equilibrar a eficiência em todas as partes do desenvolvimento de software." => :full_stack,
    "Ter habilidades abrangentes para lidar com todos os aspectos do desenvolvimento de software." => :full_stack
  }.freeze

  def question
    # Inicializa a sessão se não foi inicializada antes
    initialize_quiz_session

    @current_question = session[:current_question]
    
    if @current_question >= QUESTIONS.length
      redirect_to quiz_result_path and return
    end

    @question_data = QUESTIONS[@current_question]
  end

  def answer
    selected_option = params[:option]
    area = AREAS[selected_option]
    session[area] += 1

    session[:current_question] += 1
    redirect_to quiz_question_path
  end

  def result
    # Extrai manualmente os valores das sessões
    scores = {
      front_end: session[:front_end] || 0,
      back_end: session[:back_end] || 0,
      ciencia_dados: session[:ciencia_dados] || 0,
      desenvolvimento_mobile: session[:desenvolvimento_mobile] || 0,
      desenvolvimento_jogos: session[:desenvolvimento_jogos] || 0,
      full_stack: session[:full_stack] || 0
    }

    @result = scores.max_by { |_key, value| value }.first.to_s.humanize

    # Limpa a sessão
    reset_session
  end

  private

  def initialize_quiz_session
    session[:current_question] ||= 0
    session[:front_end] ||= 0
    session[:back_end] ||= 0
    session[:ciencia_dados] ||= 0
    session[:desenvolvimento_mobile] ||= 0
    session[:desenvolvimento_jogos] ||= 0
    session[:full_stack] ||= 0
  end
end
