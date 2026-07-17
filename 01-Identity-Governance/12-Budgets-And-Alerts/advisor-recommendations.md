# Advisor Cost Recommendations

From Azure Advisor → Cost tab, the following recommendations were observed:

1. **Right‑size or shutdown underutilized virtual machines**
   - The VM `locktest-vm` (or another) is running at low CPU utilization. Resizing to a smaller SKU could save 50%+.

2. **Buy reserved instances to save money**
   - For consistent workloads (like the test VM), reserving a 1‑year or 3‑year instance can reduce compute costs by up to 72% compared to pay‑as‑you‑go.

3. **Delete idle Azure Load Balancers**
   - An unused load balancer was identified. Removing it eliminates associated charges.
