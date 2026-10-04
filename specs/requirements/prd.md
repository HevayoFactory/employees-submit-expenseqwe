# Expense Claims

## Problem Statement

Employees pay out of pocket for business expenses and today chase paper receipts and email threads to get reimbursed. Managers lack a single place to see what is waiting on their approval, and finance re-keys approved amounts into payroll by hand, which is slow and error-prone.

## Solution

A web application where employees submit expense claims (with receipts), managers approve or reject their team's claims, and finance exports approved claims to payroll in one step.

## Actors

- **Employee** — submits expense claims with receipts and tracks their status.
- **Manager** — reviews and approves or rejects claims submitted by their team.
- **Finance** — exports approved claims to payroll.

## Features

- F1 [Submit expenses](features/F1-submit-expenses.md)
- F2 [Approvals](features/F2-approvals.md)
- F3 [Payroll export](features/F3-payroll-export.md)
- F4 [Notifications](features/F4-notifications.md)

## Product-wide

Rules that span more than one feature are in [Product-wide](product-wide.md).

## Out of Scope

- Multi-currency support — amounts are in a single company currency.
- Mileage or per-diem calculators.
- A native mobile app.

