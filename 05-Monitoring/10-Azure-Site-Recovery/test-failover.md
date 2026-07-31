# Test Failover – Procedure and Results

## Steps
1. In the vault → Replicated items → select the VM.
2. Click **Test failover**.
3. Chose the latest recovery point.
4. Selected test VNet `vnet-test-failover`.
5. Monitored the job until completion (~15 minutes).
6. Verified the test VM was running in West US2.
7. RDP connected to the test VM using the same credentials – OS and applications functional.
8. Performed **Cleanup test failover** to delete test resources.

## Outcome
- Test failover successfully created an isolated copy of the production VM without impacting the source.
- The test VM was identical to the source at the recovery point.
- Cleanup removed all test resources, leaving the replication configuration untouched.

## Key Takeaways
- Test failover is a non‑disruptive way to validate DR readiness.
- It should be performed regularly (e.g., quarterly) to ensure recovery procedures work.