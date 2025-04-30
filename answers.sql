-- Transforming ProductDetail table into 1NF
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
SELECT 
    OrderID, 
    CustomerName, 
    TRIM(value) AS Product
FROM (
    SELECT 
        OrderID, 
        CustomerName, 
        STRING_SPLIT(Products, ',') AS value
    FROM ProductDetail
) AS SplitProducts;

-- Create a new table for Orders (OrderID and CustomerName)
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Create a new table for Product details (OrderID, Product, Quantity)
INSERT INTO ProductDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;