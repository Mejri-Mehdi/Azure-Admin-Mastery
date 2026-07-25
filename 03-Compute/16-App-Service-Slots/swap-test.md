# Swap Test Documentation

## Steps
1. Deployed v1 to production, v2 to staging.
2. Set a non‑slot setting `Environment=ProductionEnv` on production.
3. Set a slot‑sticky setting `SlotName=StagingOnly` on staging.
4. Initiated swap with preview, confirmed no errors.
5. Swapped slots.

## Observed Results
- **Before swap**:
  - Production: “Hello Production v1”
  - Staging: “Hello Staging v2”
- **After swap**:
  - Production: “Hello Staging v2”
  - Staging: “Hello Production v1”
- **App settings after swap**:
  - Production now has `Environment=ProductionEnv` (moved from old staging? Actually, originally it was on production; after swap, the setting moved with the slot? In a swap, the app settings that are **not** slot-sticky move with the slot content. So the `Environment` setting, originally on production, should now be on staging, because the slots swapped. Wait – we need to correct: In our setup, we set `Environment` on the **production** slot, not on staging. After swap, that setting will move to the staging slot because the slots traded places. So the old production slot (now staging) has `Environment=ProductionEnv`. The old staging slot (now production) does not have it. Meanwhile `SlotName=StagingOnly` stays on the slot that was originally staging (now production? No, slot-sticky means the setting stays with the slot regardless of what content is in it. So the slot named "staging" (the slot we created as staging) still has `SlotName=StagingOnly`, even though it now holds the old production content. That's correct.
- After swap, the production URL (formerly staging) does **not** have `SlotName`; staging URL has `SlotName=StagingOnly`.

## Conclusion
Slot‑sticky settings are ideal for connection strings or environment‑specific configurations that should not move between slots during a swap.