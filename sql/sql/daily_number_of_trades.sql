/*
Project: Uniswap DEX Trading Activity Dashboard
Query: Daily Number of Trades Analysis (Last 30 Days)
Author: Bongani Nkosi
Platform: Dune Analytics
Dataset: dex_evm.trades

Description:
This query calculates the total number of trades executed on
Uniswap each day over the last 30 days on the Ethereum blockchain.
*/

SELECT
    block_date AS "Date",
    COUNT(*) AS "Number of Trades"
FROM dex_evm.trades
WHERE blockchain = 'ethereum'
  AND project = 'uniswap'
  AND block_date >= CURRENT_DATE - INTERVAL '30' DAY
GROUP BY block_date
ORDER BY block_date;
