<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products List</title>
    <style>
        /* General styling */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #121212;
            margin: 0;
            padding: 0;
            display: flex;
            color: #e0e0e0;
        }
        h2 {
            color: #4CAF50;
            text-align: center;
            margin: 20px 0;
            font-size: 28px;
            position: relative;
        }
        h2::after {
            content: '';
            display: block;
            width: 50%;
            height: 3px;
            background: #4CAF50;
            margin: 10px auto;
            border-radius: 5px;
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
        
        /* Content styling */
        .content {
            flex-grow: 1;
            padding: 20px;
        }
        .search-bar {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        .search-bar input[type="text"] {
            width: 70%;
            padding: 10px;
            border: 1px solid #4CAF50;
            border-radius: 5px 0 0 5px;
            margin: 0;
            background-color: #2C2C2C;
            color: #e0e0e0;
        }
        .search-bar button {
            padding: 10px 15px;
            border: none;
            border-radius: 0 5px 5px 0;
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
            margin: 0;
        }
        .search-bar button:hover {
            background-color: #45a049;
        }

        /* Product container grid */
        .product-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            max-width: 1200px;
            width: 100%;
        }

        @media (max-width: 1200px) {
            .product-container {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 900px) {
            .product-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 600px) {
            .product-container {
                grid-template-columns: 1fr;
            }
        }

        /* Product card styling */
        .product-card {
            background-color: #1E1E1E;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 15px;
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
        .product-card img {
            max-width: 100%;
            max-height: 150px;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        .product-card h3 {
            font-size: 18px;
            color: #4CAF50;
            margin: 5px 0;
        }
        .product-card p {
            margin: 0;
            color: #b3b3b3;
            font-size: 14px;
        }
        .product-card .price {
            font-size: 16px;
            color: #4CAF50;
            font-weight: bold;
            margin-top: 10px;
        }

        /* Add to cart button styling */
        .add-to-cart {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, transform 0.2s;
            width: 100%;
            margin-top: 10px;
        }
        .add-to-cart:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }
        .add-to-cart.in-stock {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        .add-to-cart.out-of-stock {
            background-color: #f44336;
            color: white;
            cursor: not-allowed;
        }

        /* Welcome message */
        .welcome-message {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .welcome-message:hover {
            transform: translateY(-2px);
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
            background-color: #45a049;
        }

        /* Logout button styling */
        .sidebar .logout {
            margin-top: auto;
            color: #b3b3b3;
            transition: background-color 0.3s, color 0.3s;
        }
        .sidebar .logout:hover {
            background-color: #f44336;
            color: #fff;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .product-card {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>
<body>
    <!-- Display Success or Error Message -->
    <c:if test="${not empty successMessage}">
        <script>
            alert("${successMessage}");
        </script>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <script>
            alert("${errorMessage}");
        </script>
    </c:if>

    <!-- Welcome message at the top right -->
    <div style="position: absolute; top: 10px; right: 10px;">
        <span class="welcome-message">Welcome, ${sessionScope.userName}!</span>
    </div>

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <h3>Navigation</h3>
        <a href="#">Home</a>
        <a href="#">Products</a>
        <a href="#">Wishlist</a>
        <a href="${pageContext.request.contextPath}/cart/details">View Cart</a>
        <a href="#">User Info</a>
        <a href="${pageContext.request.contextPath}/users/cust-login" class="logout">Log Out</a>
    </div>

    <!-- Main Content Area -->
    <div class="content">
        <div class="search-bar">
            <input type="text" placeholder="Search products..." />
            <button>Search</button>
        </div>
        <h2>Our Products</h2>
        <div class="product-container">
            <!-- Loop through the products and display them -->
            <c:forEach var="product1" items="${products}">
                <div class="product-card">
                    <c:if test="${not empty product1.base64Image}">
                        <img src="data:image/jpeg;base64,${product1.base64Image}" alt="${product1.name}" />
                    </c:if>
                    <h3>${product1.name}</h3>
                    <p><strong>Company:</strong> ${product1.company}</p>

                    <!-- Find matching stock for this product -->
                    <c:set var="matchedStock" value="${null}" />
                    <c:set var="isFound" value="false" />

                    <c:forEach var="stock" items="${stocks}">
                        <c:if test="${!isFound && product1.pid == stock.productId}">
                            <c:set var="matchedStock" value="${stock}" />
                            <c:set var="isFound" value="true" />
                        </c:if>
                    </c:forEach>

                    <!-- Display quantity based on matched stock -->
                    <p>
                        <strong>Quantity:</strong>
                        <c:choose>
                            <c:when test="${matchedStock != null && matchedStock.quantity > 0}">
                                ${matchedStock.quantity}
                            </c:when>
                            <c:otherwise>
                                Not Available
                            </c:otherwise>
                        </c:choose>
                    </p>

                    <p class="price">$${product1.price}</p>
                    
                    <!-- Add to Cart Button -->
                    <form method="POST" action="${pageContext.request.contextPath}/cart/addToCart">
                        <input type="hidden" name="productId" value="${product1.pid}" />
                        <input type="hidden" name="productName" value="${product1.name}" />
                        <input type="hidden" name="productPrice" value="${product1.price}" />

                        <button type="submit" class="add-to-cart 
                            <c:choose>
                                <c:when test="${matchedStock == null || matchedStock.quantity <= 0}">
                                    out-of-stock
                                </c:when>
                                <c:otherwise>
                                    in-stock
                                </c:otherwise>
                            </c:choose>">
                            Add to Cart
                        </button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>