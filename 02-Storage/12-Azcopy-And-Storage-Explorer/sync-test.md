# AzCopy Sync Test

## Setup
- **Source container**: `source` (50 small files)
- **Destination container**: `dest` (initially empty)

## Initial Copy
- Command: `azcopy copy ... --recursive`
- Result: All 50 files copied to destination.

## Modify and Add Files
1. Changed the content of `file1.txt` (now "Updated content").
2. Added a new file `newfile.txt`.
3. Re‑uploaded both to the source container (overwrite + new blob).

## Sync Operation
- Command: `azcopy sync https://.../source/ https://.../dest/`
- AzCopy scanned the destination, detected that `file1.txt` had a different last‑modified time and that `newfile.txt` was missing.
- It transferred only those two blobs, leaving the other 48 unchanged.

## Verification
- After sync, listing the destination container showed 51 blobs.
- Downloaded `file1.txt` from destination; content was "Updated content".
- `newfile.txt` present.

## Sync Behavior
- AzCopy sync is **incremental**: it only copies new/changed files.
- It does **not** delete files in the destination that are missing in the source by default; that can be enabled with `--delete-destination true`.
- The comparison is based on last‑modified time and file size (by default).