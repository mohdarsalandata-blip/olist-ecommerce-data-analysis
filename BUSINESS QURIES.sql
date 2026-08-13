-- Q1. Identify the state with the highest number of customers.

SELECT
    customer_state,
    COUNT(*) AS customer_count
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC;


-- Q2. Find the top 10 cities with the highest number of customers.

SELECT
    customer_city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY customer_city
ORDER BY customer_count DESC
LIMIT 10;


-- Q3. Identify the product categories with the highest number of listed products.

SELECT
    product_category_name,
    COUNT(*) AS product_count
FROM product
GROUP BY product_category_name
ORDER BY product_count DESC;


-- Q4. Determine the most frequently used payment methods.

SELECT
    payment_type,
    COUNT(*) AS payment_count
FROM payment
GROUP BY payment_type
ORDER BY payment_count DESC;


-- Q5. Calculate the average review score and show the distribution of review scores.

SELECT
    AVG(review_score) AS average_review_score
FROM review;

SELECT
    review_score,
    COUNT(*) AS review_count
FROM review
GROUP BY review_score
ORDER BY review_score;


-- Q6. Identify the top 10 sellers by number of distinct products sold.

SELECT
    seller_id,
    COUNT(DISTINCT product_id) AS distinct_products_sold
FROM item
GROUP BY seller_id
ORDER BY distinct_products_sold DESC
LIMIT 10;


-- Q7. Identify the states with the highest number of sellers.

SELECT
    seller_state,
    COUNT(*) AS seller_count
FROM seller
GROUP BY seller_state
ORDER BY seller_count DESC;


-- Q8. Analyze the distribution of order statuses.

SELECT
    order_status,
    COUNT(*) AS order_count
FROM "order"
GROUP BY order_status
ORDER BY order_count DESC;


-- Q9. Identify the most commonly used payment installment options.

SELECT
    payment_installments,
    COUNT(*) AS payment_count
FROM payment
GROUP BY payment_installments
ORDER BY payment_count DESC;


-- Q10. Check the Product table for missing values.

SELECT
    COUNT(*) - COUNT(product_category_name)
        AS missing_product_category_name,

    COUNT(*) - COUNT(product_name_lenght)
        AS missing_product_name_lenght,

    COUNT(*) - COUNT(product_description_lenght)
        AS missing_product_description_lenght,

    COUNT(*) - COUNT(product_photos_qty)
        AS missing_product_photos_qty,

    COUNT(*) - COUNT(product_weight_g)
        AS missing_product_weight_g,

    COUNT(*) - COUNT(product_length_cm)
        AS missing_product_length_cm,

    COUNT(*) - COUNT(product_height_cm)
        AS missing_product_height_cm,

    COUNT(*) - COUNT(product_width_cm)
        AS missing_product_width_cm
FROM product;


-- Q11. Calculate the total number of customers in each customer state.

SELECT
    customer_state,
    COUNT(*) AS customer_count
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC;


-- Q12. Calculate the total number of customers in each customer city Show the top 10 cities.

SELECT
    customer_city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY customer_city
ORDER BY customer_count DESC
LIMIT 10;


-- Q13. Calculate the total number of orders for each order status.

SELECT
    order_status,
    COUNT(*) AS order_count
FROM "order"
GROUP BY order_status
ORDER BY order_count DESC;


-- Q14. Calculate the total number of order items handled by each seller Show top 10 sellers.

SELECT
    seller_id,
    COUNT(*) AS order_item_count
FROM item
GROUP BY seller_id
ORDER BY order_item_count DESC
LIMIT 10;


-- Q15. Calculate the total number of products in each product category.

SELECT
    product_category_name,
    COUNT(*) AS product_count
FROM product
GROUP BY product_category_name
ORDER BY product_count DESC;


-- Q16. Calculate the total number of reviews for each review score.

SELECT
    review_score,
    COUNT(*) AS review_count
FROM review
GROUP BY review_score
ORDER BY review_count DESC;


-- Q17. Calculate the total payment value for each payment type.

SELECT
    payment_type,
    SUM(payment_value) AS total_payment_value
FROM payment
GROUP BY payment_type
ORDER BY total_payment_value DESC;


-- Q18. Calculate the total payment value for each payment installment count.

SELECT
    payment_installments,
    SUM(payment_value) AS total_payment_value
FROM payment
GROUP BY payment_installments
ORDER BY total_payment_value DESC;


-- Q19. Identify sellers who have more than 100 order items.

SELECT
    seller_id,
    COUNT(*) AS order_item_count
FROM item
GROUP BY seller_id
HAVING COUNT(*) > 100
ORDER BY order_item_count DESC;


-- Q20. Identify product categories that contain more than 500 products.

SELECT
    product_category_name,
    COUNT(*) AS product_count
FROM product
GROUP BY product_category_name
HAVING COUNT(*) > 500
ORDER BY product_count DESC;


-- Q21. Classify customers into:
-- SP = São Paulo
-- RJ = Rio de Janeiro
-- Other = All other states
-- Count customers in each group.

SELECT
    CASE
        WHEN customer_state = 'SP' THEN 'São Paulo'
        WHEN customer_state = 'RJ' THEN 'Rio de Janeiro'
        ELSE 'Other'
    END AS state_group,
    COUNT(*) AS customer_count
FROM customers
GROUP BY
    CASE
        WHEN customer_state = 'SP' THEN 'São Paulo'
        WHEN customer_state = 'RJ' THEN 'Rio de Janeiro'
        ELSE 'Other'
    END
ORDER BY customer_count DESC;


-- Q22. Classify products based on product_photos_qty:
-- 0–2 = Low Photos
-- 3–5 = Medium Photos
-- More than 5 = High Photos
-- Count products in each group.

SELECT
    CASE
        WHEN product_photos_qty <= 2 THEN 'Low Photos'
        WHEN product_photos_qty <= 5 THEN 'Medium Photos'
        ELSE 'High Photos'
    END AS photo_category,
    COUNT(*) AS product_count
FROM product
GROUP BY
    CASE
        WHEN product_photos_qty <= 2 THEN 'Low Photos'
        WHEN product_photos_qty <= 5 THEN 'Medium Photos'
        ELSE 'High Photos'
    END
ORDER BY product_count DESC;


-- Q23. Classify reviews based on review_score:
-- 1–2 = Negative
-- 3 = Neutral
-- 4–5 = Positive
-- Count reviews in each group.

SELECT
    CASE
        WHEN review_score <= 2 THEN 'Negative'
        WHEN review_score = 3 THEN 'Neutral'
        ELSE 'Positive'
    END AS review_category,
    COUNT(*) AS review_count
FROM review
GROUP BY
    CASE
        WHEN review_score <= 2 THEN 'Negative'
        WHEN review_score = 3 THEN 'Neutral'
        ELSE 'Positive'
    END
ORDER BY review_count DESC;


-- Q24. Calculate the number of orders placed in each year.

SELECT
    EXTRACT(
        YEAR FROM order_purchase_timestamp::timestamp
    ) AS order_year,
    COUNT(*) AS order_count
FROM "order"
GROUP BY
    EXTRACT(
        YEAR FROM order_purchase_timestamp::timestamp
    )
ORDER BY order_year;


-- Q25. Calculate the number of orders placed in each month.

SELECT
    EXTRACT(
        MONTH FROM order_purchase_timestamp::timestamp
    ) AS order_month,
    COUNT(*) AS order_count
FROM "order"
GROUP BY
    EXTRACT(
        MONTH FROM order_purchase_timestamp::timestamp
    )
ORDER BY order_month;


-- Q26. Calculate the average delivery time in days for delivered orders.

SELECT
    AVG(
        EXTRACT(
            EPOCH FROM (
                order_delivered_customer_date::timestamp
                - order_purchase_timestamp::timestamp
            )
        ) / 86400
    ) AS average_delivery_days
FROM "order"
WHERE order_delivered_customer_date IS NOT NULL
  AND order_purchase_timestamp IS NOT NULL;



-- Q27. Using a CTE, calculate the average payment value for each payment type.
-- Show payment types whose average payment value is greater than 100.

WITH payment_summary AS (
    SELECT
        payment_type,
        AVG(payment_value) AS average_payment_value
    FROM payment
    GROUP BY payment_type
)
SELECT
    payment_type,
    average_payment_value
FROM payment_summary
WHERE average_payment_value > 100
ORDER BY average_payment_value DESC;


-- Q28. Find all products whose weight is greater than the average product weight.

SELECT
    product_id,
    product_weight_g
FROM product
WHERE product_weight_g > (
    SELECT AVG(product_weight_g)
    FROM product
)
ORDER BY product_weight_g DESC;


-- Q29. Find sellers whose total order-item count is greater than the average order-item count
-- across all sellers.

SELECT
    seller_id,
    COUNT(*) AS order_item_count
FROM item
GROUP BY seller_id
HAVING COUNT(*) > (
    SELECT AVG(seller_item_count)
    FROM (
        SELECT
            seller_id,
            COUNT(*) AS seller_item_count
        FROM item
        GROUP BY seller_id
    ) AS seller_summary
)
ORDER BY order_item_count DESC;


-- Q30. Display each order along with the customer's city and state.

SELECT
    o.order_id,
    c.customer_city,
    c.customer_state
FROM "order" AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;


-- Q31. For each seller, calculate the total number of order items they handled.
-- Display seller city and state.

SELECT
    i.seller_id,
    s.seller_city,
    s.seller_state,
    COUNT(*) AS order_item_count
FROM item AS i
INNER JOIN seller AS s
    ON i.seller_id = s.seller_id
GROUP BY
    i.seller_id,
    s.seller_city,
    s.seller_state
ORDER BY order_item_count DESC;


-- Q32. Calculate the total sales value generated by each seller.
-- Display seller_id, seller_city, seller_state and total sales.

SELECT
    i.seller_id,
    s.seller_city,
    s.seller_state,
    SUM(i.price) AS total_sales
FROM item AS i
INNER JOIN seller AS s
    ON i.seller_id = s.seller_id
GROUP BY
    i.seller_id,
    s.seller_city,
    s.seller_state
ORDER BY total_sales DESC;


-- Q33. Calculate the total payment value for each order status.

SELECT
    o.order_status,
    SUM(p.payment_value) AS total_payment_value
FROM "order" AS o
INNER JOIN payment AS p
    ON o.order_id = p.order_id
GROUP BY o.order_status
ORDER BY total_payment_value DESC;


-- Q34. Find the top 10 product categories by total sales value.

SELECT
    p.product_category_name,
    SUM(i.price) AS total_sales
FROM item AS i
INNER JOIN product AS p
    ON i.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC
LIMIT 10;


-- Q35. Calculate the average review score for each order status.

SELECT
    o.order_status,
    AVG(r.review_score) AS average_review_score
FROM "order" AS o
INNER JOIN review AS r
    ON o.order_id = r.order_id
GROUP BY o.order_status
ORDER BY average_review_score DESC;


-- Q36. Create a combined list of cities where customers and sellers are located.
-- Remove duplicate city names.

SELECT
    customer_city AS city
FROM customers

UNION

SELECT
    seller_city AS city
FROM seller

ORDER BY city;


-- Q37. Create a combined list of states where customers and sellers are located.
-- Keep duplicate state values.

SELECT
    customer_state AS state
FROM customers

UNION ALL

SELECT
    seller_state AS state
FROM seller

ORDER BY state;


-- Q38. Calculate:
-- 1. Total number of orders
-- 2. Total payment value
-- 3. Average payment value

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(payment_value) AS total_payment_value,
    AVG(payment_value) AS average_payment_value
FROM payment;


-- Q39. Create a high-level business KPI summary:
-- 1. Total Orders
-- 2. Total Customers
-- 3. Total Sellers
-- 4. Total Payment Value
-- 5. Average Review Score

SELECT
    (SELECT COUNT(*)
     FROM "order")  