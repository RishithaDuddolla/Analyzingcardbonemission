--creating table--

CREATE TABLE StateEmissions (
    State VARCHAR(50),
    CO2_per_capita DECIMAL(10, 2),
    CO_per_capita DECIMAL(10, 2),
    CH4_per_capita DECIMAL(10, 2)
);
--inserting information--

INSERT INTO StateEmissions (State, CO2_per_capita, CO_per_capita, CH4_per_capita) VALUES
('Andhra Pradesh', 974.17, 27.18, 16.97),
('Arunachal', 405.90, 17.43, 25.82),
('Assam', 340.91, 16.63, 21.29),
('Bihar', 179.01, 8.83, 9.59),
('Chattisgarh', 1963.88, 17.56, 22.37),
('Goa', 2662.51, 23.12, 7.62),
('Gujarat', 1310.58, 24.01, 12.26),
('Haryana', 1381.86, 17.90, 21.57),
('Himachal Pradesh', 784.16, 16.98, 18.28),
('Jammu & Kashmir', 509.03, 15.59, 14.42),
('Jharkhand', 1403.43, 15.02, 15.39),
('Karnataka', 888.86, 24.93, 12.20),
('Kerala', 780.12, 18.29, 4.52),
('Madhya Pradesh', 656.37, 16.14, 15.15),
('Maharashtra', 936.70, 23.58, 9.80),
('Manipur', 379.20, 10.80, 22.63),
('Meghalaya', 691.53, 12.65, 19.80),
('Mizoram', 754.71, 15.40, 10.72),
('Nagaland', 1275.27, 24.13, 29.08),
('Odhisha', 700.13, 18.40, 19.88),
('Punjab', 1618.08, 27.90, 33.38),
('Rajasthan', 793.69, 14.33, 14.18),
('Sikkim', 711.39, 11.68, 10.04),
('Tamilnadu', 985.70, 26.60, 10.40),
('Tripura', 295.64, 17.76, 19.23),
('Uttar Pradesh', 404.26, 12.40, 12.87),
('Uttarakhand', 493.01, 14.28, 17.93),
('West Bengal', 763.13, 22.69, 15.99);

--Find the states with the highest per capita CO2 emissions--
SELECT State, CO2_per_capita
FROM StateEmissions
ORDER BY CO2_per_capita DESC
LIMIT 5;
--Find the average per capita emissions for CO2, CO, and CH4--
SELECT 
    AVG(CO2_per_capita) AS Avg_CO2_per_capita,
    AVG(CO_per_capita) AS Avg_CO_per_capita,
    AVG(CH4_per_capita) AS Avg_CH4_per_capita
FROM StateEmissions;
--List states where per capita CH4 emissions are above the average--
WITH AvgCH4 AS (
    SELECT AVG(CH4_per_capita) AS Avg_CH4_per_capita
    FROM StateEmissions
)
SELECT State, CH4_per_capita
FROM StateEmissions, AvgCH4
WHERE StateEmissions.CH4_per_capita > AvgCH4.Avg_CH4_per_capita;
--Find the total CO2 emissions for all states combined--
SELECT SUM(CO2_per_capita) AS Total_CO2_per_capita
FROM StateEmissions;
--Get the states with CO emissions higher than a specific threshold, say 20 kg per person--
SELECT State, CO_per_capita
FROM StateEmissions
WHERE CO_per_capita > 20;


