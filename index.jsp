<%@page import="java.sql.ResultSet"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.DriverManager"%>

<html>
<head>
<script src="js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link href="css/style.css" rel="stylesheet">
<title>Registration</title>

</head>

<body>
    <h1 id="heading">JSP Form</h1>
    <div class="row">
  <div class="column left" style="background-color:#991D57;">
    
		<div id="col1"  style="padding:50px 0 0 0;">
                     <h1 id="part">Participants</h1>
		      
                 </div>
      <div id="options">
      <label onclick="fetch();"></label>
                  
				<label>
					
					<select name="dept">
                                         <option value="" disabled selected>Which one are you?</option>
                                        </select>
				</label>
       </div>
  </div>
  <div class="column right" style="background-color:#991D57;">
   <div class="wrapper">
		<div id="main" style="padding:10px 0 0 0px;">
                
          
		
		<!-- Form -->
		<form id="contact-form" action="insert.jsp" method="post" enctype="multipart/form-data">
			<h3>Fill in your details</h3>
			<h4>All the answers are compulsory</h4>
			<div>
				<label>
					<span>MDB Number</span>
					<input placeholder="Please enter your name" type="text" tabindex="1" name="mdb"  required autofocus>
				</label>
			</div>
			<div>
				<label>
					<span>PayRoll ID</span>
					<input placeholder="Please enter your email address" type="text" tabindex="2" name="payroll" required>
				</label>
			</div>
			<div>
				<label>
					<span>Name</span>
					<input placeholder="Please enter your password" type="text" tabindex="3" name="name" required>
				</label>
			</div>
                        <div>
				<label>
					<span>Cost Center</span>
					<input placeholder="Please enter Cost Center" type="text" tabindex="3" name="cost" required>
				</label>
			</div>
                        <div>
				<label>
					<span>Department</span>
					<select name="dept">
                                         <option value="" disabled selected>Select your Department</option>
                                         <option value="a">a</option>
                                         <option value="b">b</option>
                                         <option value="c">c</option>
                                         <option value="d">d</option>
                                        </select>
				</label>
			</div>
                        <div>
				<label>
					<span>Address Line1</span>
					<input placeholder="Please enter your Address" type="text" tabindex="3" name="a1" required>
				</label>
			</div>
                        <div>
				<label>
					<span>Address Line2</span>
					<input placeholder="Please enter your Address" type="text" tabindex="3" name="a2" required>
				</label>
			</div>
                        <div>
				<label>
					<span>Suburb</span>
					<input placeholder="Please enter your Suburb" type="text" tabindex="3" name="suburb" required>
				</label>
			</div>
                        <div>
				<label>
					<span>State</span>
					<input placeholder="Please enter your State" type="text" tabindex="3" name="state" required>
				</label>
			</div>
                         <div>
				<label>
					<span>Postcode</span>
					<input placeholder="Please enter your postcode" type="text" tabindex="3" name="postcode" required>
				</label>
			</div>
                         <div>
				<label>
					<span>Phone Number</span>
					<input placeholder="Please enter your number" type="text" tabindex="3" name="number" required>
				</label>
			</div>
                         <div>
				<label>
					<span>Next of Kin</span>
					<input placeholder="Please enter something" type="text" tabindex="3" name="kin" required>
				</label>
			</div>
                         <div>
				<label>
					<span>Date of Birth</span>
					<input placeholder="Please enter your DOB" type="text" tabindex="3" name="dob" required>
				</label>
			</div>
                         <div>
				<label>
					<span>Registered Device</span>
					<select name="iphone10">
                                        <option value="" disabled selected>Select your Device</option>
                                         <option value="">iphone6</option>
                                         <option value="saab">samsung s8</option>
                                         <option value="mercedes">samsung s9</option>
                                         <option value="audi">htc desire pro</option>
                                        </select>
				</label>
			</div>
                        <div>
				<label>
					<span>Notes</span>
					<input placeholder="Please enter notes" type="text" tabindex="3" name="notes">
				</label>
			</div>	
                         <div      
                          <label for="file">Upload Your Photo</label>
                          <input type="file" name="photo" id="file" /><br/>
                        </div>
                        
        
			<div>
				<button name="submit" type="submit" id="contact-submit">Send</button>
			</div>
                        
		</form>
		<!-- /Form -->
		
		</div>
	</div>

	<script src="js/scripts.js"></script>

</form>
    
        </div>
  </div>
</div>


<h1 id="heading">JSP Form</h1>
<script>
            function fetch() {
        
                $.ajax({
                        beforeSend: function() {
                            $('#status').html("Status : Fetching Content");
                        },
                       cache:false,
                       type:"post",
                       url:"fetch.jsp",
                       dataType:"json",
                       success:function(res){
                          var data="";
                          for(i=0;i<res.length;i++){
                              var p=JSON.parse(res[i]);
                              data+=""+p.name+"";
                          }
                          $('#status').html("Status : Content fetched");
                          $('#content').html(data);
                       },
                       error:function() {
                           $('#status').html("Status : Failed to fetch content");
                       }
                   });
           }
</script>
</body>

</html>

