<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
       :root {
  --primary-color: #4CAF50;
  --primary-hover: #45a049;
  --background: #1a1a1a;
  --card-background: #2c2c2c;
  --text-primary: #ffffff;
  --text-secondary: #b3b3b3;
  --input-background: #3a3a3a;
  --input-text: #ffffff;
  --input-border: #4a4a4a;
  --error-color: #ff6b6b;
  --shadow-color: rgba(0, 0, 0, 0.3);
}

body {
  font-family: 'Segoe UI', Arial, sans-serif;
  background-color: var(--background);
  background-image: 
    radial-gradient(circle at 10% 20%, rgba(76, 175, 80, 0.1) 0%, transparent 30%),
    radial-gradient(circle at 90% 80%, rgba(76, 175, 80, 0.05) 0%, transparent 30%);
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
  color: var(--text-primary);
}

.login-container {
  background-color: var(--card-background);
  padding: 2.5rem;
  border-radius: 12px;
  box-shadow: 0 8px 16px var(--shadow-color);
  width: 320px;
  text-align: center;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.login-container:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 20px var(--shadow-color);
}

.login-container h2 {
  margin-bottom: 1.5rem;
  color: var(--text-primary);
  font-size: 1.8rem;
  font-weight: 600;
}

.login-container input[type="text"],
.login-container input[type="password"] {
  width: 100%;
  padding: 12px;
  margin: 10px 0;
  border: 1px solid var(--input-border);
  border-radius: 6px;
  background-color: var(--input-background);
  color: var(--input-text);
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.login-container input[type="text"]:focus,
.login-container input[type="password"]:focus {
  outline: none;
  border-color: var(--primary-color);
  box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
}

.login-container button {
  width: 100%;
  padding: 12px;
  background-color: var(--primary-color);
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  font-size: 1rem;
  font-weight: 500;
  transition: background-color 0.3s ease, transform 0.1s ease;
}

.login-container button:hover {
  background-color: var(--primary-hover);
}

.login-container button:active {
  transform: translateY(2px);
}

.error-message {
  color: var(--error-color);
  margin-bottom: 15px;
  font-size: 0.9rem;
  font-weight: 500;
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

@media (max-width: 480px) {
  .login-container {
    width: 90%;
    padding: 2rem;
  }
}
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        
         <!-- Display Error Message -->
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/products/authenticate" method="post">
            <input type="text" name="username" id="username" placeholder="Username"  required>
            <input type="password" name="password" id="password" placeholder="Password"  required>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
