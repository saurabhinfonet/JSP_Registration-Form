    <%@page import="java.sql.*,org.json.*;" %>

    <% 
        final String jdbcdriver="com.mysql.jdbc.Driver";
        final String url="jdbc:mysql://localhost/jspdb";
        final String user="#";
        final String pass="#";
        
        Connection con = null;
        Statement stmt = null;
        ResultSet result = null;
            
        try{
            Class.forName(jdbcdriver);
            con = DriverManager.getConnection(url,user,pass);
        }catch(ClassNotFoundException e){
        }catch(SQLException e){}
        
        try{
            
            String query;
            
            stmt = con.createStatement();
            
            query = "SELECT * FROM form-register";
            result = stmt.executeQuery(query);
            
            if(!result.next()){
                out.print("0");
            }else{
                JSONArray array=new JSONArray();
                do{
                    JSONObject obj = new JSONObject();
                    obj.put("name",result.getString("name"));
                    
                    array.put(obj.toString());
                }while(result.next());
                out.print(array);
            }
            
        }catch(SQLException e){
            out.print("Exception: "+e);
        }
        finally{
            if(stmt != null){
                try{
                    stmt.close();
                }catch(SQLException e){}
            }
            if(con != null){
                try{
                    con.close();
                }catch(SQLException e){}
            }
        }
    %>

%>
