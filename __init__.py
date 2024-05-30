from flask import Flask, render_template


app = Flask(__name__)


#Rotas
@app.route('/template')
def index():
    return render_template('index.html')

@app.route('/paginaCursos')
def pagina_cursos():
        return render_template('paginaCursos.html')

@app.route('/paginaEntrar')
def pagina_entrar():
        return render_template('paginaEntrar.html')

@app.route('/paginaQuiz')
def paginha_quiz():
        return render_template('paginaQuiz.html')

@app.route('/paginaRegistro')
def pagina_registro():
        return render_template('paginaRegistro.html')

@app.route('/paginaResultado')
def pagina_resultado():
        return render_template('paginaResultado.html')

@app.route('/paginaSobre')
def pagina_sobre():
        return render_template('paginaSobre.html')

@app.route('/paginaUsuario')    
def pagina_usuario():
        return render_template('paginaUsuario.html')

#Trilhas
@app.route('/paginaBack')
def pagina_back():
       return render_template('paginaBack.html')

@app.route('/paginaFront')
def pagina_front():
       return render_template('paginaFront.html')

@app.route('/paginaFullstack')
def pagina_fullstack():
       return render_template('paginaFullstack.html')

@app.route('/paginaGameDev')
def pagina_gamedev():
       return render_template('paginaGameDev.html')

@app.route('/paginaMobile')
def pagina_Mobile():
       return render_template('paginaMobile.html')

@app.route('/paginaCienciaDados')
def pagina_CiendiaDados():
       return render_template('paginaCienciaDados.html')
#FUNDAMENTOS
@app.route('/fundamnetosBack')
def fundamnetos_Back():
       return render_template('fundamentosBack.html')

@app.route('/fundamnetosCienciaDados')
def fundamnetos_CienciaDados():
       return render_template('fundamentosCienciaDados.html')

@app.route('/fundamnetosFront')
def fundamnetos_Front():
       return render_template('fundamentosFront.html')

@app.route('/fundamnetosFullStack')
def fundamnetos_FullStack():
       return render_template('fundamentosFullStack.html')

@app.route('/fundamnetosMobile')
def fundamnetos_Mobile():
       return render_template('fundamentosMobile.html')

@app.route('/fundamnetosGameDev')
def fundamnetos_front():
       return render_template('fundamentosGameDev.html')

#INTERMEDIARIO
@app.route('/intermedBack')
def intermed_Back():
       return render_template('intermedBack.html')

@app.route('/intermedCienDados')
def intermed_CienciaDados():
       return render_template('intermedCienDados.html')

@app.route('/intermedFront')
def intermed_Front():
       return render_template('intermedFront.html')

@app.route('/intermedFullStack')
def intermed_FullStack():
       return render_template('intermedFullStack.html')

@app.route('/intermedMobile')
def intermed_Mobile():
       return render_template('intermedMobile.html')

@app.route('/intermedGame')
def intermed_front():
       return render_template('intermedGame.html')

#AVANÇADO
@app.route('/avancadoBack')
def avancado_Back():
       return render_template('avancadoBack.html')

@app.route('/avancadoCienciaDados')
def favancado_CienciaDados():
       return render_template('avancadoCienciaDados.html')

@app.route('/avancadoFront')
def avancado_Front():
       return render_template('avancadoFront.html')

@app.route('/avancadoFullStack')
def avancado_FullStack():
       return render_template('avancadoFullStack.html')

@app.route('/avancadosMobile')
def avancado_Mobile():
       return render_template('avancadoMobile.html')

@app.route('/avancadoGameDev')
def avancado_front():
       return render_template('avancadoGameDev.html')

if __name__ == '__main__':
    app.run(debug=True)
