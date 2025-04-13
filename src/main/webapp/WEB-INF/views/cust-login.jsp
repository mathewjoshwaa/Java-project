<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
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

.login-container {
    background-color: #1e1e1e;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
    width: 300px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.login-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 32px rgba(0, 0, 0, 0.3);
}

h2 {
    text-align: center;
    color: #4CAF50;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
}

label {
    display: block;
    margin-bottom: 5px;
    color: #b3b3b3;
    font-size: 14px;
    font-weight: 600;
}

input[type="text"], input[type="password"] {
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

input[type="text"]:focus, input[type="password"]:focus {
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

.error-message {
    color: #ff6b6b;
    margin-bottom: 15px;
    font-size: 14px;
    text-align: center;
    padding: 10px;
    background-color: rgba(255, 107, 107, 0.1);
    border-radius: 4px;
}

.register-link {
    display: block;
    text-align: center;
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

.login-container {
    animation: fadeIn 0.5s ease-out;
}
    </style>
</head>
<body>
    <div class="login-container">
        <h2>User Login</h2>
        
        <!-- Display Error Message -->
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/users/authenticate" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
        
        <a class="register-link" href="${pageContext.request.contextPath}/users/register">Don't have an account? Register here</a>
    </div>
</body>
</html>
