<%@page import="banco.CEOBD"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.CEO"%>

<%@page import="dominio.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de CEO</title>
    </head>
    <body>
        <%
        
        String nome = request.getParameter("nome");
        String nome_empresa = request.getParameter("nome_empresa");
        String senha = request.getParameter("senha");
        String departamento =request.getParameter("Departamento");
        String confirma = request.getParameter("confirmar_senha");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String RG=request.getParameter("RG");
        String botao=request.getParameter("Gerente");
        System.out.println(botao);
            //CEOBD.validarEmail(email)
            if(CEOBD.validarEmail(email)){
                if(departamento==null){
                    response.sendRedirect("http://localhost:8080/Company/CEO/cadastrar.jsp?erro=Email_existe");
                }
                else{
                    response.sendRedirect("http://localhost:8080/Company/CEO/cadastrar_funcionario.jsp?erro=Email_existe");
                }
                 
            }else{
                if(departamento==null){
                     CEO ceo = new CEO();
                     ceo.setNome(nome);
                     ceo.setEmpresa(nome_empresa);
                    //ceo.setData(dataN);
                    ceo.setEmail(email);
                    ceo.setTelefone(telefone);
                    if(senha.equals(confirma)){
                        System.out.println("Entro");
                        ceo.setSenha(senha);
                        CEOBD.Inserir(ceo);
                        response.sendRedirect("http://localhost:8080/Company/index.jsp?cadsstro=SUCESSO");
                    }else{
                        System.out.println("Não Entro");
                        response.sendRedirect("http://localhost:8080/Company/CEO/cadastrar.jsp?erro=SENHA_ERRADA");
                    }
                }
                else if(senha.equals(confirma)){
     
                    CEO ceo = (CEO) session.getAttribute("CEO");
                    if(ceo==null){
                        response.sendRedirect("http://localhost:8080/Company/index.jsp?cadsstro=LOGIN_EXPIRADO");
                    }
                    String cod=CEOBD.procurarCodDep(departamento, ceo.getEmpresa());
                    if(cod==null){
                        response.sendRedirect("http://localhost:8080/Company/CEO/cadastrar_funcionario.jsp?erro=DEP_N_EXISTE");
                    }
                    else{
                        Funcionario fun=new Funcionario();
                        fun.setID_departamento(cod);
                        fun.setRG(RG);
                        fun.setNome(nome);
                        fun.setSenha(senha);
                        fun.setEmail(email);
                        fun.setEmpresa(ceo.getEmpresa());
                        if(botao!=null){
                            fun.setStatus_GERENTE(true);
                        }
                        else{
                            fun.setStatus_GERENTE(false);
                        }
                        CEOBD.Cadastrar_Funcionario(fun);
                        response.sendRedirect("http://localhost:8080/Company/Menu_CEO.jsp?erro=SUCESSO");
                        //fun.setStatus_GERENTE(status_GERENTE);
                     }
                }
                else{
                    response.sendRedirect("http://localhost:8080/Company/CEO/cadastrar_funcionario.jsp?erro=SENHA_ERRADA");
                    }
                }
            
        %>
        
</html>