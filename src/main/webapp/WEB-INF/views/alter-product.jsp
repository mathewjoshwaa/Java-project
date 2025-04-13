<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Products List</title>
    <style>
       :root {
  --primary-color: #4CAF50;
  --primary-hover: #45a049;
  --secondary-color: #2196F3;
  --secondary-hover: #1976D2;
  --background: #1a1a1a;
  --card-background: #2c2c2c;
  --table-header: #333333;
  --table-row-even: #262626;
  --table-row-odd: #2c2c2c;
  --table-row-hover: #363636;
  --text-primary: #ffffff;
  --text-secondary: #b3b3b3;
  --border-color: #404040;
  --shadow-color: rgba(0, 0, 0, 0.3);
}

body {
  font-family: 'Segoe UI', Arial, sans-serif;
  background-color: var(--background);
  background-image: 
    radial-gradient(circle at 10% 20%, rgba(76, 175, 80, 0.1) 0%, transparent 30%),
    radial-gradient(circle at 90% 80%, rgba(33, 150, 243, 0.1) 0%, transparent 30%);
  margin: 0;
  padding: 2rem;
  color: var(--text-primary);
  min-height: 100vh;
}

h2 {
  text-align: center;
  color: var(--text-primary);
  font-size: 2rem;
  margin-bottom: 2rem;
  font-weight: 600;
}

table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  margin: 20px 0;
  box-shadow: 0 4px 6px var(--shadow-color);
  border-radius: 8px;
  overflow: hidden;
}

th, td {
  padding: 1rem;
  text-align: left;
  border-bottom: 1px solid var(--border-color);
}

th {
  background-color: var(--table-header);
  color: var(--text-primary);
  font-weight: 600;
  text-transform: uppercase;
  font-size: 0.875rem;
  letter-spacing: 0.05em;
}

tr:nth-child(even) {
  background-color: var(--table-row-even);
}

tr:nth-child(odd) {
  background-color: var(--table-row-odd);
}

tr:hover {
  background-color: var(--table-row-hover);
  transition: background-color 0.2s ease;
}

td {
  color: var(--text-secondary);
}

img {
  border-radius: 8px;
  box-shadow: 0 2px 4px var(--shadow-color);
  transition: transform 0.2s ease;
}

img:hover {
  transform: scale(1.05);
}

.action-buttons {
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
}

.action-buttons a {
  text-decoration: none;
  color: var(--text-primary);
  padding: 0.5rem 1rem;
  border-radius: 6px;
  transition: all 0.2s ease;
  font-size: 0.875rem;
  font-weight: 500;
}

.action-buttons a:nth-child(1) {
  background-color: var(--secondary-color);
}

.action-buttons a:nth-child(1):hover {
  background-color: var(--secondary-hover);
}

.action-buttons a:nth-child(2) {
  background-color: #dc3545;
}

.action-buttons a:nth-child(2):hover {
  background-color: #c82333;
}

.action-buttons a:nth-child(3) {
  background-color: var(--primary-color);
}

.action-buttons a:nth-child(3):hover {
  background-color: var(--primary-hover);
}

.add-button {
  background-color: var(--primary-color);
  color: var(--text-primary);
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 6px;
  text-align: center;
  display: inline-block;
  margin-top: 1.5rem;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s ease;
  box-shadow: 0 2px 4px var(--shadow-color);
}

.add-button:hover {
  background-color: var(--primary-hover);
  transform: translateY(-2px);
  box-shadow: 0 4px 6px var(--shadow-color);
}

@media (max-width: 768px) {
  body {
    padding: 1rem;
  }

  table {
    display: block;
    overflow-x: auto;
    white-space: nowrap;
  }

  th, td {
    padding: 0.75rem;
  }

  .action-buttons {
    flex-direction: column;
    gap: 0.25rem;
  }

  .action-buttons a {
    text-align: center;
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

table {
  animation: fadeIn 0.5s ease-out;
}
    </style>
</head>
<body>
    <h2>Products</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Company</th>
                <th>Name</th>
                <th>Category</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total Price</th> 
                <th>Date</th>             
                <th>Picture</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product1" items="${products}">
                <tr>
                    <td>${product1.pid}</td>
                    <td>${product1.company}</td>
                    <td>${product1.name}</td>
                    <td>${product1.category}</td>
                    <td>${product1.qty}</td>
                    <td>${product1.price}</td>
                    <td>${product1.tot_price}</td>
                    <td>${product1.date}</td> 
                    
                    <td>
                        <c:if test="${not empty product1.base64Image}">
                            <img src="data:image/jpeg;base64,${product1.base64Image}" 
                                 alt="Product Picture" 
                                 style="max-width:100px; max-height:100px;"/>
                        </c:if>
                    </td>
                    <td class="action-buttons">
                        <a href="${pageContext.request.contextPath}/products/edit/${product1.id}">Edit</a>
                        <a href="${pageContext.request.contextPath}/products/delete/${product1.id}">Delete</a>
                        <a href="${pageContext.request.contextPath}/products/view/${product1.id}">View</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/products/new" class="add-button">Add New Product</a>
</body>
</html>
