create database economics_project;
use economics_project;

show tables from economics_project;    --- view all the tables in the database--

   ---------- Rename the table names-------------------
   RENAME TABLE _cpi_rural TO cpi_rural;
   alter table nifty_50_ rename to stock_price;
   alter table stock_price rename to nifty_50;
   
  ---------- view all the tables------------------------------   
delimiter //
create procedure data_view()  
begin  
select*from nifty_50;
select*from monetary_rates;
select*from cpi_rural;
select*from cpi_combined;
select*from cpi_urban;
end //
delimiter ; 

call data_view();

 ------------------ checking duplicates ----------------
select code,count(code) from monetary_rates group by code having count(code)>1;
select code,count(code) from nifty_50 group by code having count(code)>1; 
select code,count(code) from cpi_combined group by code having count(code)>1;
select code,count(code) from cpi_urban group by code having count(code)>1;
select code,count(code) from cpi_rural group by code having count(code)>1;

 ---------- deleting the duplicates ----------------
delete from cpi_urban where code=131 and inflation_rate=0;
delete from cpi_urban where code=132 and inflation_rate=0;
delete from cpi_urban where code=133 and inflation_rate=0;
delete from cpi_urban where code=134 and inflation_rate=0;
delete from cpi_urban where code=135 and inflation_rate=0;

delete from cpi_combined where code=131 and inflation_rate=0;
delete from cpi_combined where code=132 and inflation_rate=0;
delete from cpi_combined where code=133 and inflation_rate=0;
delete from cpi_combined where code=134 and inflation_rate=0;
delete from cpi_combined where code=135 and inflation_rate=0;

delete from cpi_rural where code=131  and cpi_index=0 and inflation_rate=0 ;
delete from cpi_rural where code=132 and cpi_index=0 and inflation_rate=0;
delete from cpi_rural where code=133 and cpi_index=0 and inflation_rate=0;
delete from cpi_rural where code=134  and cpi_index=0 and inflation_rate=0;
delete from cpi_rural where code=135  and cpi_index=0 and inflation_rate=0;

call data_view();
------------- describe the data------------------------
delimiter //
create procedure describe_data()
begin
DESCRIBE monetary_rates;
describe nifty_50;
describe cpi_rural;
describe cpi_combined;
describe cpi_urban;
end //
delimiter  ;

call describe_data();

  ------------- change the data types and change the column names------------------
ALTER TABLE monetary_rates 
CHANGE `Bank rate` Bank_rate DOUBLE;
ALTER TABLE monetary_rates 
CHANGE `Repo rate` Repo_rate DOUBLE;
ALTER TABLE monetary_rates 
CHANGE `Reverse repo` Reverse_repo DOUBLE;
alter table monetary_rates 
modify column year int,
modify column month varchar(20),
modify column code int;
alter table monetary_rates 
modify column bank_rate decimal(10,2),
modify column repo_rate decimal(10,2),
modify column reverse_repo decimal(10,2);

alter table nitfy_50 
modify column year int,
modify column month varchar(20),
modify column code int;
alter table stock_price 
modify column `stock price` decimal(10,2),
modify column `stock return%` decimal(10,2);
ALTER TABLE nifty_50
CHANGE `stock price` stock_price DECIMAL(10,2);
ALTER TABLE nifty_50
CHANGE `stock return%` stock_return DECIMAL(10,2);

  
alter table cpi_combined 
modify column year int,
modify column month varchar(20),
modify column code int,
modify column State varchar(100),
modify column sector varchar(100),
modify column `index` decimal(10,2),
modify column `inflation` decimal(10,2);
ALTER TABLE cpi_combined
CHANGE `index` cpi_index DECIMAL(10,2);
alter table cpi_combined change inflation inflation_rate decimal(10,2); 

alter table cpi_rural 
modify column year int,
modify column month varchar(20),
modify column code int,
modify column State varchar(100),
modify column sector varchar(100),
modify column `index` decimal(10,2),
modify column `inflation` decimal(10,2); 
ALTER TABLE cpi_rural
CHANGE `index` cpi_index DECIMAL(10,2);
alter table cpi_rural change inflation inflation_rate decimal(10,2); 

alter table cpi_urban
modify column year int,
modify column month varchar(20),
modify column code int,
modify column State varchar(100),
modify column sector varchar(100),
modify column `index` decimal(10,2),
modify column `inflation` decimal(10,2); 
ALTER TABLE cpi_urban
CHANGE `index` cpi_index DECIMAL(10,2);
alter table cpi_urban change inflation inflation_rate decimal(10,2);

     -------- checking the null values ------------  
SELECT *
FROM nifty_50
WHERE year IS NULL
   OR month IS NULL
   OR code IS NULL
   OR stock_price IS NULL
   OR stock_return IS NULL;
   
select*from monetary_rates where year is null or month is null or code is null or bank_rate is null or repo_rate is null or reverse_repo is null;    
select*from cpi_combined where year is null or month is null or code is null or state is null or sector is null or cpi_index is null or inflation_rate is null;  
select*from cpi_urban where year is null or month is null or code is null or state is null or sector is null or cpi_index is null or inflation_rate is null; 
select*from cpi_rural where year is null or month is null or code is null or state is null or sector is null or cpi_index is null or inflation_rate is null;    


-- quries---
select*from monetary_rates;
select*from nifty_50 where year=2011;
select*from cpi_combined where year=2025;
select month, repo_rate from monetary_rates where repo_rate > 6;
select*from nifty_50 where stock_return < 0;
select*from cpi_rural where year=2025;
select count(*) from cpi_urban;
select max(stock_price)from nifty_50 ;
select*from monetary_rates order by year,month;
select distinct year from nifty_50;


select year,avg(repo_rate) from monetary_rates group by year order by year;
select year,avg(stock_return)from nifty_50 group by year order by avg(stock_return) desc ;
select c.year,c.month,
c.cpi_index as combined_index ,c.inflation_rate combined_inflation,
u.cpi_index as urban_index,u.inflation_rate as urban_inflation from cpi_combined c join cpi_urban u on c.code=u.code where c.year=2025; 
select year,month,stock_return from nifty_50 where stock_return>0 order by stock_return desc;
select year,stddev(stock_return)as volatility from nifty_50 group by year;
select c.year,c.month,
c.inflation_rate combined_inflation, u.inflation_rate as urban_inflation, r.inflation_rate as rural_inflation 
from cpi_combined c join cpi_urban u on c.code=u.code 
join cpi_rural r on c.code=r.code where c.year=2025; 

SELECT 
    c.year, c.month,
    c.inflation_rate AS combined_inf,
    u.inflation_rate AS urban_inf,
    r.inflation_rate AS rural_inf
FROM cpi_combined c
JOIN cpi_urban u USING (year, month)
JOIN cpi_rural r USING (year, month)
WHERE c.year = 2025;             ----------------- this one can also used---------------

select c.year,c.month,c.inflation_rate as combined_inflation,u.inflation_rate as urban_infaltion from cpi_combined c 
join cpi_urban u on u.code=c.code where u.inflation_rate>c.inflation_rate;
select year,avg(cpi_index) from cpi_combined group by year;
select m.year,m.month,m.repo_rate,c.inflation_rate,n.stock_return from monetary_rates m 
join nifty_50 n on n.code=m.code
join cpi_combined c on c.code=m.code;
SELECT * FROM monetary_rates
WHERE reverse_repo < repo_rate;


WITH rate_change AS (
    SELECT
        m.year,
        m.month,
        m.repo_rate,
        n. stock_return,
        LAG(m.repo_rate) OVER (ORDER BY m.year) AS prev_repo
    FROM monetary_rates m
    JOIN nifty_50 n ON m.code = n.code
)
SELECT *
FROM rate_change
WHERE repo_rate > prev_repo
  AND stock_return < 0
ORDER BY year, month;
SELECT 
    n.year, n.month,
    n.stock_return,
    c.inflation_rate AS cpi_inflation
FROM nifty_50 n
JOIN cpi_combined c on c.code=n.code;
SELECT 
    year,
    CEIL(month/3) AS quarter,
    AVG(cpi_index) AS avg_quarter_cpi
FROM cpi_combined
GROUP BY year, CEIL(month/3);
SELECT 
    year, month,
    AVG(stock_return) AS avg_return,
    VARIANCE(stock_return) AS volatility
FROM nifty_50
GROUP BY year, month
ORDER BY volatility DESC;
SELECT 
    m.year, m.month,
    m.repo_rate,
    n.stock_return,
    (n.stock_return - m.repo_rate) AS difference
FROM monetary_rates m
JOIN nifty_50 n USING (year, month)
ORDER BY m.year, m.month;
SELECT 
    m.year, m.month,
    m.repo_rate,
    LEAD(n.stock_return) OVER (ORDER BY m.year, m.month) AS next_month_return
FROM monetary_rates m
JOIN nifty_50 n USING (year, month);
SELECT 
    u.year, u.month,
    u.inflation_rate AS urban_inflation,
    r.inflation_rate AS rural_inflation
FROM cpi_urban u
JOIN cpi_rural r USING (year, month)
WHERE u.inflation_rate > r.inflation_rate;
SELECT year, month, inflation_rate
FROM cpi_combined
ORDER BY inflation_rate DESC
LIMIT 5;
SELECT 
    m.year, m.month,
    (0.4 * n.stock_return) + 
    (0.3 * c.inflation_rate) + 
    (0.3 * m.repo_rate) AS economic_score
FROM monetary_rates m
JOIN nifty_50 n USING (year, month)
JOIN cpi_combined c USING (year, month);

WITH data AS (
    SELECT 
        m.year,
        m.month,
        m.repo_rate,
        LAG(m.repo_rate) OVER (
            ORDER BY 
                m.year,
                FIELD(m.month, 
                    'January','February','March','April','May','June',
                    'July','August','September','October','November','December'
                )
        ) AS prev_repo,
        c.inflation_rate,
        n.stock_return
    FROM monetary_rates m
    JOIN cpi_combined c USING (year, month)
    JOIN nifty_50 n USING (year, month)
)
SELECT *
FROM data
WHERE inflation_rate > 3
  AND stock_return < 0
  AND repo_rate > prev_repo
ORDER BY year,
    FIELD(month, 
        'January','February','March','April','May','June',
        'July','August','September','October','November','December'
    );


