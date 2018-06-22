<%@page import="java.sql.*,org.json.*;" %>

<% 
    final String jdbcdriver="com.mysql.jdbc.Driver";
    final String url="jdbc:mysql://localhost/database_name";
    final String user="admin";
    final String pass="deddenurphy";
    
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
        
        query = "SELECT * FROM register";
        result = stmt.executeQuery(query);
        
        if(!result.next()){
            out.print("0");
        }else{
            JSONArray array=new JSONArray();
            do{
                JSONObject obj = new JSONObject();
                obj.put("FirstName",result.getString("FirstName"));
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
