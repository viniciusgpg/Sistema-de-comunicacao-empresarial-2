<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <title>Cadastro de Funcionario</title>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                  <div class="navbar-header">
                    <a class="navbar-brand" href="http://localhost:8080/Company/index.jsp">ChatCompany</a>
                  </div>
                  <ul class="nav navbar-nav">
                    <li><a href="http://localhost:8080/Company/Menu_Gerente.jsp">Menu</a></li>
                    <li><a href="http://localhost:8080/Company/CEO/sobrenos.jsp">Quem somos</a></li>
                    <li><a href="http://localhost:8080/Company/CEO/contato.jsp">Fale conosco</a></li>
                  </ul>
                </div>
             </nav>
        </header>
        <div class="container" >
            <a class="links" id="paracdtfun"></a>
            <div class="content">      
                <div id="cdtfun">
                    <form method="post" action="salvar_gerente.jsp"> 
                        <h1>Cadastrar Funcionário</h1>
                        <p> 
                            <label for="nome_login">Nome</label>
                            <input name="nome" class="form-control" required="required" type="text" placeholder="Digite nome do funcionário"/>
                        </p>
                        <p> 
                            <label>RG</label>
                            <input name="RG" class="form-control" required="required" type="text" maxlength="9"/>
                        </p>
                        
                            <label>Email</label>
                            <input name="email" class="form-control" required="required" type="text" placeholder="Email@empresa.com"/>
                        </p>
                        <p>
                       <label for="telefone_cad">Telefone</label>
                       <input id="telefone_cad" name="telefone" class="form-control" required="required" type="int" placeholder="Digite seu telefone"/>
                    </p>
                        <div class="col-md-6">
                            
                            <%
                            String erro = request.getParameter("Erro");
                            if (erro != null){
                                if (erro.equals("SENHA_ERRADA")){
                                %>
                                Senha errada. Tente novamente
                                <%
                                } else if(erro.equals("CAMPO_VAZIO")){
                                %>
                                Campo Vazio. Tente novamente
                                <%
                                }

                            }   
                            %>
                            <input type="submit" class="btn btn-primary mb-2 corbotao" name="salvar" value="Confirmar">
                        </div>
                    </form>           
                </div>
            </div>   
        </div>
        </div>
        <div class="footer">
        © ChatCompany 2020
        </div>
    </body>
</html>

<style>
    .navbar-default {
        background-color: #ACFBF5;
        border-color: #5A76E7;
    }
    
    .navbar-brand {
        float: left;
        padding: 15px 15px;
        font-weight: bolder;
        font-size: 18px;
        line-height: 20px;
        color: #001000;
    }
    ul{list-style: none;
    }
    li {
    float: left;
    text-decoration: none;
    }

    li a {
      display: block;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }
    .content{
    width: 500px;
    min-height: 500px;    
    margin: 0px auto;
    position: relative;   
    }
    h1{
    font-size: 15px;
    color: #066a75;
    padding: 2px 0 10px 0;
    font-family: Arial,sans-serif;
    font-weight: bold;
    text-align: center;
    padding-bottom: 30px;
    }
    h1:after{
    content: ' ';
    display: block;
    width: 100%;
    height: 2px;
    margin-top: 10px;
    background: -webkit-linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
    background: linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
    }
    p{
    margin-bottom:15px;
    }
    .content p:first-child{
    margin: 0px;
    }
    ::-webkit-input-placeholder  {
    color: #bebcbc; 
    font-style: italic;
    }
    input:-moz-placeholder,
    textarea:-moz-placeholder{
    color: #bebcbc;
    font-style: italic;
    }
    input:not([type="checkbox"]){
    width: 95%;
    margin-top: 4px;
    padding: 10px;    
    border: 1px solid #b2b2b2;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.6) inset;
    box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.6) inset;
    -webkit-transition: all 0.2s linear;
    transition: all 0.2s linear;
    }
    input[type="submit"]{
    width: 90%!important;
    cursor: pointer;  
    background: rgb(61, 125, 150);
    padding: 8px 5px;
    color: #fff;
    font-size: 20px;  
    border: 1px solid #fff;   
    margin-bottom: 10px;  
    text-shadow: 0 1px 1px #333;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    transition: all 0.2s linear;
    }
    input[type="submit"]:hover{
    background: #4ab3c6;
    }
    #cdtfun{
    position: absolute;
    top: 0px;
    width: 90%;   
    padding: 8px 6% 2px 5%;
    margin: 0 0 25px 0;
    background: #f7f7f7;
    border: 1px solid rgba(147, 184, 189,0.8);
    -webkit-box-shadow: 5px;
    border-radius: 5px;
    -webkit-animation-duration: 0.5s;
    -webkit-animation-timing-function: ease;
    -webkit-animation-fill-mode: both;
    animation-duration: 0.5s;
    animation-timing-function: ease;
    animation-fill-mode: both;
    }
    #paracdtfun:target ~ .content #cdtfun{
    z-index: 2;
    -webkit-animation-name: fadeInLeft;
    animation-name: fadeInLeft;
     -webkit-animation-delay: .1s;
    animation-delay: .1s;
    }
    .footer {
    position:absolute;
    text-align: center;
    bottom:0;
    width:100%;
    background-color: lemonchiffon;
    }
    body{
        background-image: url("table.PNG");
        background-repeat: no-repeat;
        background-position:  100% 25%;
        background-size: 100%;
        

    }
</style>
