# Lifecycle Policy Rule Explanation

The policy applies to blobs with the prefix `documents/important/`.  
It contains three rules, evaluated in order (top to bottom).

| Rule Name                  | Condition (days since last modification) | Action         | Effect |
|----------------------------|------------------------------------------|----------------|--------|
| MoveToCoolAfter30Days      | > 30 days                                | Tier to Cool   | Moves blobs to Cool storage to reduce storage cost. |
| MoveToArchiveAfter90Days   | > 90 days                                | Tier to Archive| Moves blobs from Cool (or Hot) to Archive for long-term retention. |
| DeleteAfter365Days         | > 365 days                               | Delete         | Permanently removes blobs that exceed retention need. |

**Important notes:**
- The `prefixMatch` filter ensures only blobs under `documents/important/` are affected. Other blobs in the same container are ignored.
- `daysAfterModificationGreaterThan` is measured from the last write time of the blob. Once a rule matches, the action is applied.
- Rules are evaluated in sequence; a blob will first move to Cool (if >30 days), then later to Archive (if >90 days), and finally be deleted (if >365 days).
- The policy runs daily and can take up to 24 hours after condition is met to take action.