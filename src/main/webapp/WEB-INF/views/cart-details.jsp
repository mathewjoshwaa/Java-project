<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <style>
        /* General styling */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            background-color: #121212;
            color: #e0e0e0;
        }

        /* Sidebar styling */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #1E1E1E;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            color: #fff;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .sidebar h3 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .sidebar a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #b3b3b3;
            font-weight: bold;
            margin: 10px 0;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .sidebar a:hover {
            background-color: #4CAF50;
            color: #fff;
        }
        .sidebar a.active {
            background-color: #4CAF50;
            color: #fff;
        }

        /* Main content styling */
        .content {
            margin-left: 20px;
            padding: 20px;
            width: calc(100% - 290px);
            background-color: #1E1E1E;
            display: flex;
            flex-direction: column;
            margin: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            color: #4CAF50;
            margin-bottom: 20px;
            position: relative;
        }
        h2::after {
            content: '';
            display: block;
            width: 50%;
            height: 3px;
            background: #4CAF50;
            margin: 10px 0;
            border-radius: 5px;
        }

        /* Cart table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #2C2C2C;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #404040;
        }

        th {
            background-color: #4CAF50;
            color: #ffffff;
            font-weight: bold;
        }

        tr:hover {
            background-color: #363636;
            transition: background-color 0.3s;
        }

        .quantity-button {
            padding: 8px 16px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            transition: all 0.3s ease;
            margin: 0 5px;
        }

        .quantity-button:hover {
            background-color: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* Total amount section styling */
        .total-amount {
            font-size: 20px;
            font-weight: bold;
            color: #4CAF50;
            margin-top: 20px;
            padding: 15px;
            background-color: #2C2C2C;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Payment method container */
        .payment-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #2C2C2C;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            width: 250px;
            text-align: center;
            animation: slideUp 0.5s ease-out;
        }

        @keyframes slideUp {
            from { transform: translateY(100px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .payment-container h4 {
            color: #4CAF50;
            margin-bottom: 15px;
        }

        /* Radio button styling */
        .payment-container div {
            margin: 10px 0;
            padding: 10px;
            background-color: #363636;
            border-radius: 5px;
            transition: background-color 0.3s;
            cursor: pointer;
        }

        .payment-container div:hover {
            background-color: #404040;
        }

        .payment-container input[type="radio"] {
            margin-right: 10px;
        }

        .payment-container label {
            cursor: pointer;
        }

        .buy-now-button {
            padding: 12px 24px;
            background-color: #4CAF50;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            transition: all 0.3s ease;
            width: 100%;
            cursor: pointer;
            margin-top: 15px;
        }

        .buy-now-button:hover {
            background-color: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        /* Hide default radio button */
		input[type="radio"] {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid #4CAF50;
    border-radius: 50%;
    outline: none;
    cursor: pointer;
    background-color: #3B3B3B;
    position: relative;
    transition: background-color 0.3s;
}

/* Style when radio is checked */
input[type="radio"]:checked {
    background-color: #4CAF50;
    border: 2px solid #4CAF50;
}
        

        /* Logout button styling */
        .sidebar .logout {
            margin-top: auto;
            color: #b3b3b3;
        }

        .sidebar .logout:hover {
            background-color: #f44336;
            color: #fff;
        }

        /* Animation for button clicks */
        .quantity-button:active, .buy-now-button:active {
            transform: translateY(0);
            box-shadow: none;
        }

    </style>
</head>
<body>
    <!-- Sidebar for navigation -->
    <div class="sidebar">
        <h3>Navigation</h3>
        <a href="${pageContext.request.contextPath}/products/list">Home</a>
        <a href="#">Products</a>
        <a href="#">Wishlist</a>
        <a href="${pageContext.request.contextPath}/cart/details" class="active">View Cart</a>
        <a href="#">About Us</a>
        <a href="${pageContext.request.contextPath}/users/cust-login" class="logout">Log Out</a>
    </div>

    <!-- Main content area for cart details -->
    <div class="content">
        <h2>Your Cart</h2>
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td>${item.productId}</td>
                        <td>${item.productName}</td>
                        <td>$${item.productPrice}</td>
                        <td>${item.quantity}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/cart/updateQuantity" method="post" style="display: inline;">
                                <input type="hidden" name="productId" value="${item.productId}" />
                                <input type="hidden" name="userName" value="${item.userName}" />
                                <input type="hidden" name="action" value="decrease" />
                                <button type="submit" class="quantity-button">-</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/cart/updateQuantity" method="post" style="display: inline;">
                                <input type="hidden" name="productId" value="${item.productId}" />
                                <input type="hidden" name="userName" value="${item.userName}" />
                                <input type="hidden" name="action" value="increase" />
                                <button type="submit" class="quantity-button">+</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="total-amount">
            Total Amount: 
            <c:set var="totalAmount" value="0" />
            <c:forEach var="item" items="${cartItems}">
                <c:set var="totalAmount" value="${totalAmount + (item.productPrice * item.quantity)}" />
            </c:forEach>
            <span>$${totalAmount}</span>
        </div>

        <div class="payment-container">
            <h4>Select Payment Method</h4>
            <form action="${pageContext.request.contextPath}/cart/submitOrder" method="post">
                <input type="hidden" name="userName" value="${sessionScope.userName}" />
                <div>
                    <input type="radio" id="cashOnDelivery" name="paymentMethod" value="cashOnDelivery" />
                    <label for="cashOnDelivery">Cash on Delivery</label>
                </div>
                <div>
                    <input type="radio" id="gpay" name="paymentMethod" value="gpay" />
                    <label for="gpay">Pay with GPay</label>
                </div>
                <button type="submit" class="buy-now-button">Buy Now</button>
            </form>
        </div>
    </div>
</body>
</html>