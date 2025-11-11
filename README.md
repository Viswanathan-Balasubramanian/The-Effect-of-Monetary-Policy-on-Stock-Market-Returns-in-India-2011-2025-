# The-Effect-of-Monetary-Policy-on-Stock-Market-Returns-in-India-2011-2025-
This project is about how the monetary rates like bank rate ,repo rate, reverse repo affects the stock market and how it is impacting in the real world.it also studies about how CPI inflation rate affects the market and monetary rates too. 

# Monetary Policy Rates 
1. Bank Rate
   The bank rate is the long-term rate at which the RBI lends money to commercial banks.It influences long-term lending rates in the economy.When RBI increases the bank rate → borrowing becomes expensive → economic activity slows → stock market may react negatively.

2. Repo Rate
   Repo (Repurchase) Rate is the rate at which RBI lends short-term money to commercial banks against government securities.It is the most important monetary policy tool.When repo rate increases: borrowing becomes costlier,loans (home, business) become expensive,liquidity reduces,stock market tends to fall.When repo rate decreases:liquidity increases,investment rises,
stock market usually gains.

3. Reverse Repo Rate
   Reverse Repo Rate is the rate at which RBI borrows money from commercial banks.It is used to control liquidity.Higher reverse repo rate → banks prefer depositing money with RBI → money supply reduces.Lower reverse repo rate → more money remains in the economy.

# Stock Market Variables 
1. Nifty 50 Stock Price
   The Nifty 50 is India’s major stock market index, consisting of 50 large companies across sectors.It is used as a benchmark for Indian stock market performance. Daily closing prices are used for analysis.

2. Stock Returns
   Stock return is the percentage change in stock price.You can calculate daily, monthly, or yearly returns.
Formula: stock return = cuurent month price - previous month price/previous month price * 100.
Example:
If price changes from 10,000 to 10,500 → return = 5%.
Stock returns show how the market reacts to interest rate changes, inflation, and economic news.

 # CPI (Consumer Price Index) – Explained

1. CPI Combined Inflation
   CPI Combined is the overall inflation rate in India.It measures price changes across:food,housing,transportation,clothing and health.It represents inflation for both rural + urban areas combined.RBI uses this as the main inflation measure when deciding repo rate.

2. CPI Urban Inflation
   Measures the inflation specifically for urban areas. Covers:rent,transport,services,education and healthcare.Urban inflation affects salaried workers and businesses in cities.

3. CPI Rural Inflation
   Measures inflation in rural areas. Covers: food,fuel,agricultural goods and rural wages.Rural inflation impacts farmers and rural households.


  # Data Sources
RBI database – repo rate, reverse repo, bank rate
NSE website – Nifty stock prices
Ministry of Statistics – CPI rural, urban, combined

  # Time period
  From 2011-2025

  # Tools used for this project 
  Excel,Python,SQL and Power BI.

  1.Excel 
    In Excel cleaned missing values, Combined multiple datasets (monetary + CPI + stock),Created new columns like stock returns,Verified using filters, pivot tables.

  2.SQL 
    Imported datasets into MySQL, Cleaned data using SQL (JOIN, LAG, WHERE, date formatting),Wrote analytical queries,Ensured data consistency

  3 Python Analysis
    Explain that Python was used for: Charts (matplotlib, seaborn),Correlation analysis,Regression model (OLS),Checking significance (p-values, R²)
 
  4 Power BI Visualization
   Repo/Reverse Repo trend
   CPI inflation trends
   Stock price and return comparison
   Multi-card KPI dashboard
   
 # Findings
    ## Monetary Policy vs Stock Market
    ## Strong negative correlation with Stock Price

       Bank rate & Stock Price = –0.436
       Repo rate & Stock Price = –0.479
       Reverse repo & Stock Price = –0.864

   Meaning:
         Higher interest rates → higher borrowing cost → lower market liquidity → stock prices fall. Reverse repo has the strongest effect because it influences liquidity absorption by RBI.

    ## Very weak correlation with stock return

       Repo rate & stock return = –0.056
       Bank rate & stock return = 0.003
       Reverse repo & stock return = -0.058

   Meaning:
      Daily or monthly stock returns are noisy and influenced by market behavior, so interest rates do not explain short-term returns directly.


 ## Inflation Rate vs Monetary Policy
 ## Weak correlations

    Repo rate & combined inflation = 0.018
    Reverse repo & combined inflation = –0.033
    Bank rate & combined inflation = 0.195

    Meaning:
     Inflation rates change month-to-month due to food prices, oil, supply shocks.RBI policy changes happen few times yearly.Therefore correlation is low.


  ## Stock Return vs Inflation
  ## Weak positive correlation

stock return & combined inflation = 0.148
stock return & urban inflation = 0.164
stock return & rural inflation = 0.144

Meaning:
There is no strong relationship.Stock returns depend on global markets, sentiment, company earnings → not just inflation.

## Overall  findings
    RBI interest rates move together (very high correlation).
    Higher interest rates → lower stock prices (negative correlation).
    Stock price and inflation index move together due to long-term trends, not direct impact.
    Inflation rate and policy rates show weak correlation.
    Urban, rural, and combined inflation indicators are almost identical in movement.
    Stock return is weakly correlated with inflation and rates → short-term returns unpredictable.
    regression models show very low R² and insignificant coefficients, confirming that:
        → Short-term stock behavior is not driven by macroeconomic variables like interest rates or inflation.
        → Market sentiment, global factors, and company fundamentals drive stock prices and returns.

## conclusion


The objective of this study was to examine the relationship between monetary policy indicators (bank rate, repo rate, reverse repo rate), inflation measures (combined, urban, rural), and stock market performance in India. Based on the correlation and regression analyses conducted on the dataset, several key insights emerge.
The correlation results show that monetary policy rates are highly synchronized, indicating coordinated policy movements by the RBI. These policy rates exhibit a negative relationship with stock prices, implying that tighter monetary conditions are generally associated with lower market levels. However, this relationship does not extend to stock returns, which show almost no correlation with interest rates—highlighting the short-term unpredictability of stock market movements.
Inflation indices (combined, urban, rural) demonstrate very strong positive correlations with stock prices, driven mainly by the long-term upward trend present in both series. However, inflation rates themselves show very weak or negligible correlation with both stock prices and stock returns, suggesting that short-term inflation fluctuations do not significantly influence market performance.The regression analysis reinforces these findings. Both models—stock return on monetary variables and stock price on inflation variables—show extremely low explanatory power (R² < 3%). None of the monetary or inflation variables were statistically significant predictors of stock prices or returns. This indicates that movements in interest rates and inflation do not have a measurable short-term impact on India’s stock market. The presence of autocorrelation in stock price residuals further reveals that stock prices follow a strong time trend rather than being driven by macroeconomic indicators.

Overall, the results suggest that short-term stock market behavior in India is largely independent of changes in interest rates and inflation. Instead, stock performance appears to be driven primarily by market sentiment, global economic conditions, institutional flows, and company-level fundamentals. Monetary policy and inflation may influence long-term market direction, but their short-run effects on stock prices and returns are limited.This study concludes that macroeconomic variables like interest rates and inflation have minimal predictive ability for near-term stock market movements. Investors, analysts, and policymakers should therefore consider broader market dynamics and global influences when assessing stock market behavior rather than relying solely on domestic macroeconomic indicators.
