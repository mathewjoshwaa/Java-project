<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Product</title>
    <style>
        body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #121212;
    background-image: 
        radial-gradient(circle at 10% 20%, rgba(76, 175, 80, 0.1) 0%, transparent 30%),
        radial-gradient(circle at 90% 80%, rgba(33, 150, 243, 0.1) 0%, transparent 30%);
    margin: 0;
    padding: 20px;
    color: #e0e0e0;
    min-height: 100vh;
}

h2 {
    text-align: center;
    color: #4CAF50;
    font-size: 2rem;
    margin-bottom: 2rem;
    font-weight: 600;
}

.product-details {
    background-color: #1e1e1e;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
    padding: 30px;
    max-width: 600px;
    margin: auto;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.product-details:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 32px rgba(0, 0, 0, 0.3);
}

.product-details p {
    font-size: 16px;
    margin: 15px 0;
    color: #b3b3b3;
    padding: 10px;
    border-bottom: 1px solid #333;
}

.product-details p:last-child {
    border-bottom: none;
}

.product-details strong {
    color: #4CAF50;
    margin-right: 10px;
    font-weight: 600;
}

.product-image {
    text-align: center;
    margin: 25px 0;
    padding: 20px;
    background-color: #2c2c2c;
    border-radius: 8px;
}

.product-image strong {
    display: block;
    margin-bottom: 15px;
    color: #4CAF50;
}

.product-image img {
    max-width: 80%;
    height: auto;
    border: 2px solid #4CAF50;
    border-radius: 8px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.product-image img:hover {
    transform: scale(1.02);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.back-link {
    display: block;
    text-align: center;
    margin-top: 25px;
    color: #2196F3;
    text-decoration: none;
    font-size: 16px;
    padding: 10px;
    transition: color 0.3s ease;
}

.back-link:hover {
    color: #64b5f6;
}

@media (max-width: 768px) {
    .product-details {
        padding: 20px;
        margin: 10px;
    }

    .product-image img {
        max-width: 95%;
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

.product-details {
    animation: fadeIn 0.5s ease-out;
}
    </style>
</head>
<body>
    <h2>Product Details</h2>
    <div class="product-details">
        <p><strong>ID:</strong> ${product.pid}</p>
        <p><strong>Name:</strong> ${product.name}</p>
        <p><strong>Company:</strong> ${product.company}</p>
        <p><strong>Quantity:</strong> ${product.qty}</p>
        <p><strong>Price:</strong> $${product.price}</p>
        <p><strong>Purchased Date:</strong> ${product.date}</p>

        <div class="product-image">
            <strong>Image:</strong>
            <c:if test="${not empty product.base64Image}">
                <img src="data:image/jpeg;base64,${product.base64Image}" 
                     alt="${product.name}" />
            </c:if>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/products/alter" class="back-link">Back to Modification</a>
</body>
</html>
