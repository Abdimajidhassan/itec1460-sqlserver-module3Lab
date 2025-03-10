-- create a new stored procedure that calculattes the 
-- total amount for an order.
-- need 2 parameters as input
-- accepts order id and total amount
-- return the updated total amount as output


CREATE OR ALTER PROCEDURE CalculateOrderTotal
    @OrderID INT,
    @TotalAmount MONEY OUTPUT
AS 
BEGIN
    SET NOCOUNT ON;

    -- Calculate the total amount for the given order
    SELECT @TotalAmount = SUM(UnitPrice * Quantity * (1 - Discount))
    FROM [Order Details]
    WHERE OrderID = @OrderID;

    -- Check if the order exists
    IF @TotalAmount IS NULL
    BEGIN
        SET @TotalAmount = 0;
        PRINT 'Order ' + CAST(@OrderID AS NVARCHAR(10)) + ' not found.';
        --exists the code 
        RETURN;
        END
        PRINT 'The total amount for Order ' + CAST(@OrderID AS 
        NVARCHAR(10)) + ' is $' + CAST(@TotalAmount AS NVARCHAR(20));

END
-- Test with an invalid order
SET @OrderID = 99999;
SET @TotalAmount = NULL;

EXEC CalculateOrderTotal 
    @OrderID = @OrderID, 
    @TotalAmount = @TotalAmount OUTPUT;

PRINT 'Returned total amount: $' + CAST(ISNULL(@TotalAmount, 0) AS NVARCHAR(20));
GO

-- Test with a valid order
--First declare the variables
DECLARE @OrderID INT = 10248;
DECLARE @TotalAmount MONEY;

EXEC CalculateOrderTotal 
    @OrderID = @OrderID, 
    @TotalAmount = @TotalAmount OUTPUT;
PRINT 'Returned total amount: $' + CAST(ISNULL(@TotalAmount, 0) AS NVARCHAR(20));
GO


-- part 2 --

CREATE OR ALTER PROCEDURE CheckProductStock
    @ProductID INT,
    @NeedsReorder BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @NeedsReorder = SUM(UnitsInStock * ReorderLevel )
    FROM Products
    WHERE ProductID = @ProductID;


END
GO

-- Test the new procedure
DECLARE @NeedsReorder BIT;
EXEC CheckProductStock 
    @ProductID = 11,
    @NeedsReorder = @NeedsReorder OUTPUT;
PRINT 'Needs Reorder: ' + CAST(@NeedsReorder AS VARCHAR(1));
    
    

