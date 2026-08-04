/*
Project: Uniswap DEX Trading Activity Dashboard
Query: Average Trade Size Analysis (Last 30 Days)
Author: Bongani Nkosi
Platform: Dune Analytics
Dataset: dex_evm.trades

Description:
This query calculates the average USD value of trades executed on
Uniswap each day over the last 30 days on the Ethereum blockchain.
*/

SELECT
    block_date AS "Date",
    ROUND(AVG(amount_usd), 2) AS "Average Trade Size (USD)"
FROM dex_evm.trades
WHERE blockchain = 'ethereum'
  AND project = 'uniswap'
  AND amount_usd IS NOT NULL
  AND block_date >= CURRENT_DATE - INTERVAL '30' DAY
GROUP BY block_date
ORDER BY block_date;
