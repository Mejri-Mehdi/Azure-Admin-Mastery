# Advisor Alert Configuration

## Alert Rule
- **Name**: `High-Impact-Security`
- **Scope**: Subscription
- **Category**: Security
- **Impact**: High
- **Action Group**: `Budget-Alert-Group` (email + SMS)

## Purpose
Receive immediate notifications when Advisor identifies a new high‑impact security recommendation, so the security team can act quickly.

## Creation Steps
1. Advisor → Alerts → New Advisor Alert
2. Select subscription scope
3. Configuration: Category = Security, Impact = High
4. Action group: select existing or create new
5. Rule name: `High-Impact-Security`
6. Create