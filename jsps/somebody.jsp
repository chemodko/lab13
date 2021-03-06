<%@ page import="java.util.*" %>
<%@ page import="java.util.Map.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head>
        <style> 
            <%@ include file="../css/style.css"%>
        </style>
    </head>
    <body bgcolor="#A9A9A9", class="text"> 
        <%
            String group = (String)request.getAttribute("group");
            Map<String, ArrayList<String>> map = (Map<String, ArrayList<String>>)request.getAttribute("map"); 
            Map<String, ArrayList<String>> groups = (Map<String, ArrayList<String>>)request.getAttribute("groups"); 

            out.print("<h1>" + group + " page! </h1>\n");
        
            if (group.equals("All")) {
                for (Entry<String, ArrayList<String>> entry : map.entrySet()) {
                    String name = entry.getKey();
                    out.print("<p>" + name + " " + groups.get(name) + "</p>\n");
                    
                    if (entry.getValue() != null) {
                        out.print("<p>" + entry.getValue() + "</p><br> \n");
                    }
                }
            }
            else { 
                for (Entry<String, ArrayList<String>> entry : groups.entrySet()) {
                    String name = entry.getKey();
                    if (entry.getValue().contains("@" + group)) {
                        out.print("<p>" + name + "</p>\n");
                        out.print("<p>" + map.get(name) + "</p><br>\n");
                    }
                }
            }
        %>
        <h3><a href="/lab13/notebook">Start page</a></h3>
    </body>
</html>