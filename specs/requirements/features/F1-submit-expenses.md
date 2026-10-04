# Submit expenses

## Purpose

Employees create and submit expense claims with receipts; an agent reads each uploaded receipt and pre-fills the claim's amount, date and merchant for the employee to confirm or edit.

## User Stories

- F1.1 As an employee, I create an expense claim for a single expense, with an amount, a date, a merchant and a category.
- F1.2 As an employee, I attach a receipt to my claim, required before I can submit it.
- F1.3 As an employee, when I attach a receipt, an agent reads it and pre-fills the amount, date and merchant for me to confirm or edit.
- F1.4 As an employee, I choose a category for my claim from a fixed list.
- F1.5 As an employee, I submit my claim for my manager's approval.
- F1.6 As an employee, I edit or withdraw my claim while it is still pending a decision.
- F1.7 As an employee, I see the status of each of my claims — pending, approved or rejected.

## Decisions

- A claim covers a single expense; several expenses are submitted as separate claims.
- A receipt is always required to submit a claim.
- A claim's category is chosen from a fixed list rather than typed freely.

## Open Questions

1. What categories should the fixed list hold, and who maintains it?

