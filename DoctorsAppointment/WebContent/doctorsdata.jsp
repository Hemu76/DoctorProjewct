<%@ page language="java" import="java.util.*,doctorsAppointment.Doctors"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctors Data</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    /* Add your custom CSS styles here */
    .custom-card {
        margin-bottom: 20px;
    }

    /* Set a fixed height and overflow for the card body */
    .custom-card .card-body {
        height: 150px; /* Set your desired height here */
        overflow: auto; /* Add scrollbars if content overflows */
    }

    .custom-card .card {
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease-in-out;
    }

    .custom-card .card:hover {
        transform: scale(1.05);
    }

    /* Style for labels */
    .custom-label {
        font-weight: bold;
    }

    /* Style for text input */
    .custom-textbox {
        width: 100%;
        padding: 8px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    /* Style for the search button */
    .custom-search-button {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .custom-search-button:hover {
        background-color: #0056b3;
    }

    /* Style for card content */
    .custom-card-content {
        padding: 10px;
    }
</style>
</head>
<body>

<center>
            <label class="custom-label">Specializations<select id="ds" class="custom-textbox">
                <option>All</option>
            </select></label>
            <button id="sea" class="custom-search-button"  type="button">Search</button>
        </center>
    <div class="container mt-4">
    
                <div id="card-container" class="row mt-4"></div>
        <div class="row mt-4" id="hii">
        
            <%
                ArrayList<Doctors> ad = (ArrayList<Doctors>) request.getAttribute("dl");
                for (Doctors d : ad) {
                	String data="img="+d.getPhoto()+"&name="+d.getFullname()+"&qual="+d.getQualification()+"&exp="+d.getExperience()+"&desg="+d.getDesignation();
                	
            %>
            
            <div class="col-md-4 custom-card" id="gval">
                <div class="card">
                    <img src="<%=d.getPhoto() %>" class="card-img-top" alt="...">
                    <div class="card-body custom-card-content">
                        <h6 class="custom-label">Name:</h6>
                        <p><%=d.getFullname() %></p>
                        <h6 class="custom-label">Designation:</h6>
                        <p class=".card-title"><%=d.getDesignation() %></p>
                        <a href="doctorDetails.jsp?<%=data %>" class="btn btn-primary">View Doctor</a>
                        <!-- Add content here (it will be scrollable if it exceeds the fixed height) -->
                    </div>
                </div>
            </div>
            <%
                }
            %>
           </div>
           
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <script type="text/javascript">
            	var sel=document.getElementById("ds");
            	<%
            		for(Doctors d : ad){
            	%>
            		var opt=document.createElement("option");
            		opt.textContent="<%=d.getDesignation()%>";
            		sel.appendChild(opt);
            	<%}%>
            	var mm=0;
            	document.getElementById("sea").addEventListener("click", function(event) {
            		var zx=document.getElementById("hii");
            		mm=mm+1;
            		if(mm>0){
            			zx.innerHTML="";
            		}
            		event.preventDefault();
            		document.getElementById("card-container").innerHTML="";
            	    var si = document.getElementById("ds").value;
					var xhr=new XMLHttpRequest();
					xhr.open('GET','first2?dataa='+si,true);
					xhr.onreadystatechange=function(){
						var dz=JSON.parse(xhr.responseText);
						var arr=[dz];
						var i=dz.length;
						var c=0;
						zx.innerHTML="";
						var cardContainer = document.getElementById("card-container");
						dz.forEach(function (d) {
						    // Create a card container
						    console.log(c);
						    c=c+1;
						    if(c<=i){
						    var cardDiv = document.createElement("div");
						    cardDiv.className = "col-md-4 custom-card";

						    // Create the card element
						    var card = document.createElement("div");
						    card.className = "card";

						    // Create the card image
						    var cardImage = document.createElement("img");
						    cardImage.className = "card-img-top";
						    cardImage.src = d.photo;
						    cardImage.alt = "Doctor's Photo";

						    // Create the card body
						    var cardBody = document.createElement("div");
						    cardBody.className = "card-body custom-card-content";

						    // Create and populate card content
						    var nameLabel = document.createElement("h6");
						    nameLabel.className = "custom-label";
						    nameLabel.textContent = "Name:";
						    var nameValue = document.createElement("p");
						    nameValue.textContent = d.fullname;

						    var designationLabel = document.createElement("h6");
						    designationLabel.className = "custom-label";
						    designationLabel.textContent = "Designation:";
						    var designationValue = document.createElement("p");
						    designationValue.textContent = d.designation;

						    // Create the "View Doctor" button
						    var viewButton = document.createElement("a");
						    viewButton.href = "doctorDetails.jsp?img=" + d.photo + "&name=" + d.fullname + "&desg=" + d.designation;
						    viewButton.className = "btn btn-primary";
						    viewButton.textContent = "View Doctor";

						    // Append elements to the card body
						    cardBody.appendChild(nameLabel);
						    cardBody.appendChild(nameValue);
						    cardBody.appendChild(designationLabel);
						    cardBody.appendChild(designationValue);
						    cardBody.appendChild(viewButton);

						    // Append elements to the card
						    card.appendChild(cardImage);
						    card.appendChild(cardBody);

						    // Append the card to the container
						    cardDiv.appendChild(card);
						    cardContainer.appendChild(cardDiv);
						    }
						});
						
					}
					xhr.send();
            	    
            	});

            	
            </script>
    
</body>
</html>
