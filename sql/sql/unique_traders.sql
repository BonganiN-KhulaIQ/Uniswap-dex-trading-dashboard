/*
Project: Uniswap DEX Trading Activity Dashboard
Query: Daily Unique Traders Analysis (Last 30 Days)
Author: Bongani Nkosi
Platform: Dune Analytics
Dataset: dex_evm.trades

Description:
This query calculates the number of unique wallet addresses
that executed trades on Uniswap each day over the last 30 days
on the Ethereum blockchain.
*/

SELECT
    block_date AS "Date",
    COUNT(DISTINCT tx_from) AS "Unique Traders"
FROM dex_evm.trades
WHERE blockchain = 'ethereum'
  AND project = 'uniswap'
  AND block_date >= CURRENT_DATE - INTERVAL '30' DAY
GROUP BY block_date
ORDER BY block_date;
