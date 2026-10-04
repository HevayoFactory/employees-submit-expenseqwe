# Payroll export

## Purpose

Finance exports approved expense claims to payroll.

Needs: F2.

## User Stories

- F3.1 As finance, I see all approved claims that have not yet been exported.
- F3.2 As finance, I export those claims as a downloadable file, whenever I choose.
- F3.3 As finance, a claim I have already exported is excluded from later exports, so it is never paid twice.

## Decisions

- Export produces a downloadable file (e.g. CSV) that finance uploads into whatever payroll system they use; there is no direct payroll integration.
- No payroll system is named yet; the export format stays generic until one is chosen, at design time.
- Exports run on demand, not on a schedule.
- Each approved claim is exported exactly once.

