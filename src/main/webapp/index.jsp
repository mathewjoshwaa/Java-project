<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Our Store</title>
<style>
:root {
  --primary-color: #3b82f6;
  --primary-hover: #60a5fa;
  --secondary-color: #10b981;
  --secondary-hover: #34d399;
  --background: #111827;
  --card-background: #1f2937;
  --text-primary: #f3f4f6;
  --text-secondary: #d1d5db;
  --shadow-color: rgba(0, 0, 0, 0.3);
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
  background-color: var(--background);
  background-image: 
    radial-gradient(circle at 10% 20%, rgba(59, 130, 246, 0.1) 0%, transparent 30%),
    radial-gradient(circle at 90% 80%, rgba(16, 185, 129, 0.1) 0%, transparent 30%);
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
  color: var(--text-primary);
}

.container {
  text-align: center;
  background-color: var(--card-background);
  padding: 3rem;
  border-radius: 1rem;
  box-shadow: 
    0 4px 6px var(--shadow-color),
    0 10px 15px -3px var(--shadow-color);
  max-width: 450px;
  width: 100%;
  transform: translateY(0);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.container:hover {
  transform: translateY(-5px);
  box-shadow: 
    0 6px 8px var(--shadow-color),
    0 12px 17px -3px var(--shadow-color);
}

.container h1 {
  color: var(--text-primary);
  font-size: 2.25rem;
  font-weight: 700;
  margin-bottom: 2rem;
  line-height: 1.2;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.button-container {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  margin-top: 2rem;
}

.button {
  display: inline-block;
  padding: 1rem 1.5rem;
  font-size: 1.125rem;
  font-weight: 500;
  color: var(--text-primary);
  text-decoration: none;
  border-radius: 0.5rem;
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
  border: none;
  cursor: pointer;
  outline: none;
}

.button::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(
    120deg,
    transparent,
    rgba(255, 255, 255, 0.2),
    transparent
  );
  transition: all 0.6s;
}

.button:hover::before {
  left: 100%;
}

.admin-button {
  background-color: var(--secondary-color);
}

.admin-button:hover {
  background-color: var(--secondary-hover);
}

.customer-button {
  background-color: var(--primary-color);
}

.customer-button:hover {
  background-color: var(--primary-hover);
}

@media (max-width: 480px) {
  .container {
    padding: 2rem;
  }
  
  .container h1 {
    font-size: 1.875rem;
  }
  
  .button {
    padding: 0.875rem 1.25rem;
    font-size: 1rem;
  }
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

.container {
  animation: fadeIn 0.6s ease-out;
}

.button {
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.button:active {
  transform: translateY(0);
  box-shadow: none;
}
</style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Our Store</h1>
        <div class="button-container">
            <a href="/project/products/login" class="button admin-button">Admin Login</a>
            <a href="/project/users/cust-login" class="button customer-button">Customer Login</a>
        </div>
    </div>
</body>
</html>