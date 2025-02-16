
## 5. Get the products that have the highest and lowest manufacturing costs. 
## The final output should contain these fields, 
## product_code, product, manufacturing_cost

SELECT * FROM dim_product;
SELECT * FROM fact_manufacturing_cost;

SELECT p.product_code, p.product, m.manufacturing_cost 
FROM dim_product p 
INNER JOIN fact_manufacturing_cost m
ON p.product_code = m.product_code
WHERE manufacturing_cost IN (
					SELECT min(manufacturing_cost) FROM fact_manufacturing_cost
					UNION
					SELECT max(manufacturing_cost) FROM fact_manufacturing_cost
                    )
ORDER BY manufacturing_cost DESC

						
