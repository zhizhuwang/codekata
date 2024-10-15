
#include <cassert>
#include <vector>
#include <iostream>

#if 0
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction.If you cannot achieve any profit, return 0.



Example 1:

Input: prices = [7, 1, 5, 3, 6, 4]
Output : 5
Explanation : Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6 - 1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
Example 2 :

	Input : prices = [7, 6, 4, 3, 1]
	Output : 0
	Explanation : In this case, no transactions are done and the max profit = 0.
#endif

int maxProfit(std::vector<int>& prices)
{
	int buy = 0, sell = 0;
	int max = 0;

	for (int i = 1; i < prices.size(); i++)
	{
		for (int j = i+1; j < prices.size(); j++)
			if (prices[j] - prices[i] > max)
			{
				buy = i;
				sell = j;
				max = prices[j] - prices[i];
			}
	}
	return max;
}

int maxProfit2(std::vector<int>& prices)
{
	int minPrice = INT_MAX;
	int maxProfit = 0;

	for (int i = 0; i < prices.size(); i++)
	{
		maxProfit = std::max(prices[i]-minPrice, maxProfit);
		minPrice = std::min(minPrice, prices[i]);
	}
	
	return maxProfit;
}

void test_best_buy_and_sell_stock()
{
	assert(0 == 0);
	std::vector<int> prices{ 7, 1, 5, 3, 6, 4 };
	assert(maxProfit(prices) == 5);
	assert(maxProfit2(prices) == 5);

	std::vector<int> prices2{ 7, 6, 4, 3, 1};
	std::cout <<"max profit"<< maxProfit(prices2) << std::endl;
	assert(maxProfit(prices2) == 0);
	assert(maxProfit2(prices2) == 0);
}
