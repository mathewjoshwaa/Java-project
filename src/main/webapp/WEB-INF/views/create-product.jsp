<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Product</title>
    <style>
       body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #121212;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
    padding: 20px;
    color: #e0e0e0;
}

.form-container {
    background-color: #1e1e1e;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 500px;
    transition: box-shadow 0.3s ease, transform 0.3s ease;
}

.form-container:hover {
    box-shadow: 0 12px 32px rgba(0, 0, 0, 0.3);
    transform: translateY(-5px);
}

.form-container h2 {
    text-align: center;
    color: #4CAF50;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
}

.form-group {
    margin-bottom: 20px;
    position: relative;
}

.form-group label {
    display: block;
    font-weight: 600;
    margin-bottom: 6px;
    color: #b3b3b3;
    font-size: 14px;
}

.form-group input[type="text"],
.form-group input[type="number"],
.form-group input[type="file"],
.form-group select {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #444;
    border-radius: 6px;
    box-sizing: border-box;
    transition: border-color 0.3s, box-shadow 0.3s;
    background-color: #2c2c2c;
    color: #e0e0e0;
}

.form-group input[type="text"]:focus,
.form-group input[type="number"]:focus,
.form-group select:focus,
.form-group input[type="file"]:focus {
    border-color: #4CAF50;
    outline: none;
    box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
}

.form-container input[type="submit"] {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    color: #ffffff;
    background-color: #4CAF50;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
    transition: background-color 0.3s, transform 0.2s;
}

.form-container input[type="submit"]:hover {
    background-color: #45a049;
    transform: translateY(-2px);
}

.form-container input[type="submit"]:active {
    transform: translateY(0);
}

.form-group select {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background: url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="%23e0e0e0" d="M7 10l5 5 5-5z"/></svg>') no-repeat right 10px center;
    background-color: #2c2c2c;
    padding-right: 40px;
}

@media (max-width: 600px) {
    .form-container {
        padding: 20px;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
    }
}

input[type="file"] {
    border: 1px solid #444;
    background-color: #2c2c2c;
    color: #e0e0e0;
    padding: 8px;
}

input[type="file"]::-webkit-file-upload-button {
    background-color: #4CAF50;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="file"]::-webkit-file-upload-button:hover {
    background-color: #45a049;
}

input[readonly] {
    background-color: #3a3a3a;
    color: #b3b3b3;
}
    </style>
    
    <script type="text/javascript">
        function calculateTotalPrice() {
            var qty = document.getElementById("qty").value;
            var price = document.getElementById("price").value;
            var totalField = document.getElementById("tot_price");

            var quantity = parseFloat(qty) || 0;
            var unitPrice = parseFloat(price) || 0;
            var totalPrice = quantity * unitPrice;

            totalField.value = totalPrice.toFixed(2);
        }
    </script>
    
</head>
<body>
    <div class="form-container">
        <h2>Create New Product</h2>
        <form action="${pageContext.request.contextPath}/products/save" method="post" enctype="multipart/form-data">
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
                <input type="number" id="qty" name="qty" value="${product.qty}" oninput="calculateTotalPrice()" required/>
            </div>

            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" step="0.01" value="${product.price}" oninput="calculateTotalPrice()" required/>
            </div>

            <div class="form-group">
                <label for="tot_price">Total Price:</label>
                <input type="text" id="tot_price" name="tot_price" value="${product.tot_price}" readonly/>
            </div>
            
            
                <div class="form-group">
       	 <label for="date">Date:</label>
       	 <input type="text" name="date" id="date" class="form-control" value="${product.date}"readonly/>
   			 </div>

            <div class="form-group">
                <label for="picture">Picture:</label>
                <input type="file" id="picture" name="pic1" required/>
            </div>

            <input type="submit" value="Save"/>
        </form>
    </div>
    
    <script>
    // Set the current date in the 'date' field as value
    window.onload = function() {
        var currentDate = new Date().toISOString().split('T')[0]; // Get date in YYYY-MM-DD format
        document.getElementById("date").value = currentDate;
    };
</script>
</body>
</html>
