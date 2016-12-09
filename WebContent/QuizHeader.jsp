<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
h211 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px; font-weight:normal; color:#7D0552; text-decoration:none
}
h212 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px; font-weight:bold; color:#7D0552; text-decoration:none
}
h213 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px; font-weight:normal; color:#7D0552; text-decoration:none
}
h216 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:16px; font-weight:bold; color:#7D0552; text-decoration:none
}

h217 { 
	font-family:Verdana, Arial, Helvetica, sans-serif; font-size:50px; font-weight:bold; color:#7D0552; text-decoration:none
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
      
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<script>
$('#demo3').click(function(){ 
  var $target = $($(this).data('target')); 
  if(!$target.hasClass('in'))
    $('.collapse .in').removeClass('in').height(0);    
});
</script>
<script type="text/javascript">
function setchkval(){
	
	var el = document.getElementsByTagName('hdflg');
	if (el.value=="2")  
	{
		el.value = 1;
		var allInputs = document.getElementsByTagName("input");
		for (var i = 0, max = allInputs.length; i < max; i++){
		    if (allInputs[i].type === 'checkbox')
		        allInputs[i].checked = false;
		}
	}
	else
	{
		el.value = 2;
		var allInputs = document.getElementsByTagName("input");
		for (var i = 0, max = allInputs.length; i < max; i++){
		    if (allInputs[i].type === 'checkbox')
		        allInputs[i].checked = true;
		}
	}		
}

function getchkval(){
	
	var el = document.getElementsByTagName('hdflg');
	
	if (el.value=="2")  
	{
		var cntr = 0;
		var allInputs = document.getElementsByTagName("input");
		var max = 0;
		max = allInputs.length;
		var max1 = 0;
		for (var i = 0; i < max; i++){
		    if (allInputs[i].type === 'checkbox')
		    {
		    	max1++;
		    }		        
		}
		for (var i = 0; i < max; i++){
		    if (allInputs[i].type === 'checkbox' && allInputs[i].checked == true)
		    {
		    	cntr++;		    	
		    }
		}
		if(cntr<max1)
		{			
			el.value = 1;
			document.getElementById("chkdell").checked = false;
		}	
	}
	else
	{			
		var cntr = 0;
		
		var allInputs = document.getElementsByTagName("input");
		var max = 0;
		max = allInputs.length;
		var max1 = 0;
		for (var i = 0; i < max; i++){
		    if (allInputs[i].type === 'checkbox')
		    {
		    	max1++;
		    }		        
		}
		for (var i = 0; i < max; i++){
		    if (allInputs[i].type === 'checkbox' && allInputs[i].checked == true)
		    {
		    	cntr++;
		    }		        
		}
		
		if(cntr==(max1-1))
		{
			setchkval();
		}	
	}		
}
</script>

</head>
<body >

<div class="navbar-before navbar-before-inverse">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="online-test">Online Test</h3>
            </div>
           
        </div>
    </div>
</div>
 
</body>
</html>