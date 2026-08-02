# Disaster Recovery Test Results

## Test Date
2026-08-02

## Test Scope
Non‑disruptive test failover for `vm-dr-primary` using Azure Site Recovery.

## Procedure
1. In ASR vault → Replicated items → `vm-dr-primary` → **Test failover**.
2. Selected the latest recovery point.
3. Chose the test virtual network `vnet-dr-secondary`.
4. Monitored the job in the vault (took 18 minutes).
5. Verified the test VM (`vm-dr-primary-test`) was running in West US2.
6. RDP connected using the original credentials; Windows desktop appeared, IIS was running (if installed).
7. Executed **Cleanup test failover** to remove test resources.

## Conclusion
- Test failover was successful with no production impact.
- RTO observed was 18 minutes, well within the 30‑minute objective.
- Recovery point was crash‑consistent; no data loss compared to the source at that moment.