<%-- 
    Document   : salvar_projeto
    Created on : 23/10/2020, 20:09:06
    Author     : edu_p
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="banco.CEOBD"%>
<%@page import="java.text.Normalizer"%>
<%@page import="dominio.CEO"%>
<%@page import="dominio.Projeto"%>
<%@page import="dominio.Funcionario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>salvar projeto</title>
    </head>
    <body>
        <%
            
        HttpSession sessao = request.getSession();
       
        String nome=request.getParameter("nome_projeto");
        System.out.println(nome);
        String departamento=request.getParameter("departamento");
        String tarefa=request.getParameter("tarefa_inicial");
         // nome = Normalizer.normalize(nome, Normalizer.Form.NFD);
          //nome = nome.replaceAll("[^\p{ASCII}]", "");
        if(sessao.isNew()){
            response.sendRedirect("http://localhost:8080/Company/index.jsp");
        }
        else{
            CEO ceo=(CEO) session.getAttribute("CEO");
            if(ceo==null){
                Funcionario fun=(Funcionario) sessao.getAttribute("Gerente");
                if(fun==null){
                    response.sendRedirect("http://localhost:8080/Company/index.jsp");
                }
                Projeto proj= new Projeto();
                proj.setID_Departamento(fun.getID_departamento());
                proj.setNome(nome);
                
                CEOBD.Criar_Projeto(proj);
                if(tarefa!=null){
                    int ID_Projeto=CEOBD.ProcurarIDProjeto(nome, fun.getID_departamento());
                    CEOBD.Atribuir_Tarefa_Projeto(ID_Projeto, tarefa);
                }
                response.sendRedirect("http://localhost:8080/Company/Menu_Gerente.jsp");
            }
            else{
                String empresa=ceo.getEmpresa();
               
                String id_dep=CEOBD.procurarCodDep(departamento, empresa);
                Projeto proj= new Projeto();
                proj.setID_Departamento(id_dep);
                proj.setNome(nome);
                
                CEOBD.Criar_Projeto(proj);
                if(tarefa!=null){
                    int ID_Projeto=CEOBD.ProcurarIDProjeto(nome, id_dep);
                    CEOBD.Atribuir_Tarefa_Projeto(ID_Projeto, tarefa);
                }
                response.sendRedirect("http://localhost:8080/Company/Menu_CEO.jsp");
            }
        }
        %>
    </body>
</html>
