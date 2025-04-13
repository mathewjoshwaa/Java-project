<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #121212;
    background-image: 
        radial-gradient(circle at 10% 20%, rgba(76, 175, 80, 0.1) 0%, transparent 30%),
        radial-gradient(circle at 90% 80%, rgba(33, 150, 243, 0.1) 0%, transparent 30%);
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    color: #e0e0e0;
}

.registration-container {
    background-color: #1e1e1e;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
    width: 300px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.registration-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 32px rgba(0, 0, 0, 0.3);
}

h2 {
    color: #4CAF50;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
}

label {
    display: block;
    margin-bottom: 8px;
    color: #b3b3b3;
    text-align: left;
    font-size: 14px;
    font-weight: 600;
}

input[type="text"], input[type="password"], input[type="email"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #444;
    border-radius: 6px;
    font-size: 16px;
    background-color: #2c2c2c;
    color: #e0e0e0;
    transition: border-color 0.3s, box-shadow 0.3s;
}

input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
    border-color: #4CAF50;
    outline: none;
    box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
}

button[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
    font-weight: 600;
}

button[type="submit"]:hover {
    background-color: #45a049;
    transform: translateY(-2px);
}

button[type="submit"]:active {
    transform: translateY(0);
}

.register-link {
    display: block;
    margin-top: 20px;
    color: #2196F3;
    text-decoration: none;
    font-size: 14px;
    transition: color 0.3s;
}

.register-link:hover {
    color: #64b5f6;
    text-decoration: underline;
}

.input-group {
    margin-bottom: 20px;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.registration-container {
    animation: fadeIn 0.5s ease-out;
}body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #121212;
    background-image: 
        radial-gradient(circle at 10% 20%, rgba(76, 175, 80, 0.1) 0%, transparent 30%),
        radial-gradient(circle at 90% 80%, rgba(33, 150, 243, 0.1) 0%, transparent 30%);
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    color: #e0e0e0;
}

.registration-container {
    background-color: #1e1e1e;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
    width: 300px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.registration-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 32px rgba(0, 0, 0, 0.3);
}

h2 {
    color: #4CAF50;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
}

label {
    display: block;
    margin-bottom: 8px;
    color: #b3b3b3;
    text-align: left;
    font-size: 14px;
    font-weight: 600;
}

input[type="text"], input[type="password"], input[type="email"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #444;
    border-radius: 6px;
    font-size: 16px;
    background-color: #2c2c2c;
    color: #e0e0e0;
    transition: border-color 0.3s, box-shadow 0.3s;
}

input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
    border-color: #4CAF50;
    outline: none;
    box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
}

button[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
    font-weight: 600;
}

button[type="submit"]:hover {
    background-color: #45a049;
    transform: translateY(-2px);
}

button[type="submit"]:active {
    transform: translateY(0);
}

.register-link {
    display: block;
    margin-top: 20px;
    color: #2196F3;
    text-decoration: none;
    font-size: 14px;
    transition: color 0.3s;
}

.register-link:hover {
    color: #64b5f6;
    text-decoration: underline;
}

.input-group {
    margin-bottom: 20px;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.registration-container {
    animation: fadeIn 0.5s ease-out;
}
    </style>
</head>
<body>
    <div class="registration-container">
        <h2>User Registration</h2>
        <form action="${pageContext.request.contextPath}/users/save" method="post">
            <div class="input-group">
                <label for="usr_name">Name:</label>
                <input type="text" id="usr_name" name="usr_name" required>
            </div>

            <div class="input-group">
                <label for="usr_pass">Password:</label>
                <input type="password" id="usr_pass" name="usr_pass" required>
            </div>

            <div class="input-group">
                <label for="usr_email">Email:</label>
                <input type="email" id="usr_email" name="usr_email" required>
            </div>

            <div class="input-group">
                <label for="usr_num">Phone Number:</label>
                <input type="text" id="usr_num" name="usr_num" required>
            </div>

            <div class="input-group">
                <label for="usr_address">Address:</label>
                <input type="text" id="usr_address" name="usr_address" required>
            </div>

            <button type="submit">Register</button>
        </form>
        
        <a class="register-link" href="${pageContext.request.contextPath}/users/login">Already have an account? Login here</a>
    </div>
</body>
</html>
