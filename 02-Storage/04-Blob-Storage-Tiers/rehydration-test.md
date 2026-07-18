# Archive Rehydration Test

**Blob**: `archive-blob.txt` in `data` container  
**Initial tier**: Archive  
**Action**: Attempt download, observe failure, then rehydrate to Hot.

## Steps
1. **Download attempt** → `az storage blob download`  
   - **Error**: `The operation is not allowed because the blob is in Archive tier and needs to be rehydrated first.`
2. **Initiate rehydration** → `az storage blob set-tier --tier Hot`  
   - Rehydration status changes to `rehydrate-pending-to-hot`.
3. **Poll status** (every 5 minutes): `az storage blob show --query "properties.rehydrationStatus"`  
   - Small blobs (<1 MB) typically rehydrate in <15 minutes with Standard priority.  
4. **Final status**: rehydration status becomes `null` → blob is Hot and readable.
5. **Download after rehydration** → successful.

## Key Takeaways
- Archive tier is offline; no read or modify operations are possible until rehydration completes.
- Rehydration time depends on blob size and priority (Standard: up to 15 hours for large blobs; High: minutes for small objects).
- Costs apply for reading data from Archive: $5/GB for Standard rehydration, $10/GB for High priority (approximate).