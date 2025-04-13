<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Product</title>
    <style>
        :root {
          --primary-color: #4CAF50;
          --primary-hover: #45a049;
          --secondary-color: #2196F3;
          --secondary-hover: #1976D2;
          --background: #1a1a1a;
          --card-background: #2c2c2c;
          --text-primary: #ffffff;
          --text-secondary: #b3b3b3;
          --input-background: #3a3a3a;
          --input-border: #4a4a4a;
          --input-focus-border: #6a6a6a;
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
          display: flex;
          flex-direction: column;
          align-items: center;
        }

        h2 {
          text-align: center;
          color: var(--text-primary);
          font-size: 2rem;
          margin-bottom: 2rem;
          font-weight: 600;
        }

        form {
          background-color: var(--card-background);
          border-radius: 12px;
          box-shadow: 0 4px 6px var(--shadow-color);
          padding: 2rem;
          width: 100%;
          max-width: 500px;
          margin: auto;
        }

        .form-group {
          margin-bottom: 1.5rem;
        }

        label {
          display: block;
          margin-bottom: 0.5rem;
          font-weight: 500;
          color: var(--text-secondary);
        }

        input[type="text"],
        input[type="number"],
        input[type="file"],
        select {
          width: 100%;
          padding: 0.75rem;
          border: 1px solid var(--input-border);
          border-radius: 6px;
          background-color: var(--input-background);
          color: var(--text-primary);
          font-size: 1rem;
          transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus {
          border-color: var(--input-focus-border);
          outline: none;
          box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
        }

        input[type="file"] {
          padding: 0.5rem;
          background-color: var(--input-background);
          color: var(--text-primary);
          border: 1px dashed var(--input-border);
          cursor: pointer;
        }

        input[type="file"]::-webkit-file-upload-button {
          background-color: var(--primary-color);
          color: var(--text-primary);
          padding: 0.5rem 1rem;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          transition: background-color 0.3s;
        }

        input[type="file"]::-webkit-file-upload-button:hover {
          background-color: var(--primary-hover);
        }

        input[type="submit"] {
          background-color: var(--primary-color);
          color: var(--text-primary);
          border: none;
          padding: 0.75rem 1rem;
          border-radius: 6px;
          cursor: pointer;
          font-size: 1rem;
          font-weight: 500;
          transition: background-color 0.3s, transform 0.2s;
          width: 100%;
        }

        input[type="submit"]:hover {
          background-color: var(--primary-hover);
          transform: translateY(-2px);
        }

        input[type="submit"]:active {
          transform: translateY(0);
        }

        .back-link {
          display: inline-block;
          text-align: center;
          margin-top: 1.5rem;
          color: var(--secondary-color);
          text-decoration: none;
          font-weight: 500;
          transition: color 0.3s;
        }

        .back-link:hover {
          color: var(--secondary-hover);
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

        form {
          animation: fadeIn 0.5s ease-out;
        }

        @media (max-width: 600px) {
          body {
            padding: 1rem;
          }

          form {
            padding: 1.5rem;
          }
        }
    </style>
</head>
<body>
    <h2>Modify Product</h2>
    <form action="${pageContext.request.contextPath}/products/update/${product.id}" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${product.id}"/>
        
        <div class="form-group">
            <label for="productid">Product Id:</label>
            <input type="text" id="productid" name="pid" value="${product.pid}" required/>
        </div> 

        <div class="form-group">
            <label for="company">Company:</label>
            <input type="text" id="company" name="company" value="${product.company}" required/>
        </div>

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${product.name}" required/>
        </div>
        
        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" name="category" required>
                <option value="Fashion" ${product.category == 'Fashion' ? 'selected' : ''}>Fashion</option>
                <option value="Electronics" ${product.category == 'Electronics' ? 'selected' : ''}>Electronics</option>
                <option value="Books" ${product.category == 'Books' ? 'selected' : ''}>Books</option>
                <option value="Sports" ${product.category == 'Sports' ? 'selected' : ''}>Sports</option>
                <option value="Gadgets" ${product.category == 'Gadgets' ? 'selected' : ''}>Gadgets</option>
            </select>
        </div>

        <div class="form-group">
            <label for="qty">Quantity:</label>
            <input type="number" id="qty" name="qty" value="${product.qty}" required/>
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" step="0.01" value="${product.price}" required/>
        </div>
        
        <div class="form-group">
            <label for="tot_price">Total Price:</label>
            <input type="text" id="tot_price" name="tot_price" value="${product.tot_price}" readonly/>
        </div>

        <div class="form-group">
            <label for="picture">Picture:</label>
            <input type="file" id="picture" name="pic1" required/>
        </div>

        <input type="submit" value="Save"/>
    </form>

    <a href="${pageContext.request.contextPath}/products/alter" class="back-link">Back to list</a>
</body>
</html>