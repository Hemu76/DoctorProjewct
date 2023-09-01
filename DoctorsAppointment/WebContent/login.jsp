<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">

<style type="text/css">
/* custom.css */
/* Add your custom CSS styles here */

/* Style the login form container */
.container {
	max-width: 400px;
}

/* Style the login form labels */
label {
	font-weight: bold;
}

/* Add some padding to the form elements */
.form-control {
	margin-bottom: 15px;
}

/* Center the login form */
.container {
	text-align: center;
}

/* Style the login button */
.btn-primary {
	width: 100%;
}
</style>
<link rel="stylesheet" href="custom.css">
</head>
<body>
	<div class="container mt-5">
		<div class="card">
			<div class="card-header">
				<h3 class="text-center">Login</h3>
			</div>
			<div class="card-body">
				<form action="first1">
					<div class="form-group">
						<label for="uname">User Name:</label> <input type="text"
							class="form-control" id="uname" name="uname" required>
					</div>
					<div class="form-group">
						<label for="upassword">Password:</label>
						<div class="input-group">
							<input type="password" class="form-control" id="upassword"
								name="upassword" required toggle="#upassword">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary toggle-password"
									type="button">
									<i class="fa fa-eye" aria-hidden="true"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label> <input type="checkbox"> Remember Me
						</label>
					</div>
					<button type="submit" class="btn btn-primary btn-block">Login</button>
				</form>
				<div class="text-center mt-3">
					<a href="#">Forgot Password?</a> | <a href="#">Register</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap and custom JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- Add custom JavaScript for password toggle -->
	<script src="custom.js">
		$(document).ready(function() {
			$(".toggle-password").click(function() {
				$(this).toggleClass("fa-eye fa-eye-slash");
				var input = $($(this).attr("toggle"));
				if (input.attr("type") === "password") {
					input.attr("type", "text");
				} else {
					input.attr("type", "password");
				}
			});
		});
	</script>
</body>
</html>
