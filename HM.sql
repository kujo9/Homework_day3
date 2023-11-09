SELECT c.customer_id, c.first_name, c.last_name, c.address FROM customer c JOIN city ci ON c.city_id = ci.city_id WHERE ci.country = 'US' AND ci.state = 'TX';
SELECT p.payment_id, p.amount, c.first_name, c.last_name FROM payment p JOIN customer c ON p.customer_id = c.customer_id WHERE p.amount > 6.99;
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN city ci ON c.city_id = ci.city_id
WHERE ci.country = 'NP';
SELECT s.staff_id, s.first_name, s.last_name, COUNT(*) AS transaction_count
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY transaction_count DESC
LIMIT 1;
SELECT rating, COUNT(*) AS movie_count
FROM film
GROUP BY rating;
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
WHERE c.customer_id IN (
    SELECT DISTINCT customer_id
    FROM payment
    WHERE amount > 6.99
    HAVING COUNT(*) = 1
);
SELECT COUNT(*) AS free_rental_count
FROM rental
WHERE rental_rate = 0.00;

