// Expense Claims — three roles, six screens

screen MyClaims "Employee submits expense claims and tracks their status"
  navbar "ExpenseClaims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  row
    heading "My Claims"
    right
    button "New claim" primary -> NewClaim
  table "Date | Merchant | Category | Amount | Status" -> ClaimDetail
    row "Oct 1, 2026 | Downtown Diner | Meals | $42.50 | Pending"
    row "Sep 28, 2026 | Metro Transit | Travel | $18.00 | Approved"
    row "Sep 20, 2026 | Office Depot | Office Supplies | $64.99 | Rejected"

screen NewClaim "Employee uploads a receipt and submits a new claim"
  navbar "ExpenseClaims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  breadcrumb "My Claims / New claim"
  heading "New Claim"
  button "Upload receipt" primary  // in place — triggers the receipt reader agent to pre-fill the fields below
  text "Receipt read — amount, date and merchant pre-filled below. Review before submitting."
  row
    input "Amount — e.g. 42.50"
    input "Date — e.g. 2026-10-01"
  input "Merchant — e.g. Downtown Diner"
  select "Category: Meals"
  row
    right
    button "Cancel" -> MyClaims
    button "Submit claim" primary -> MyClaims

screen ClaimDetail "Employee views one of their claims and edits or withdraws it while pending"
  navbar "ExpenseClaims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  breadcrumb "My Claims / Downtown Diner"
  row
    heading "Downtown Diner"
    badge "Pending" warning
  text "Oct 1, 2026 — $42.50 — Meals"
  image "Receipt"
  row
    right
    button "Withdraw" danger
    button "Edit" primary  // in place — fields become editable on this page while the claim is pending

screen TeamQueue "Manager reviews pending claims submitted by their direct reports"
  navbar "ExpenseClaims"
  sidebar "Team Queue -> TeamQueue"
  row
    heading "Team Queue"
    right
    select "Status: Pending"
  row
    card "Pending claims | 4 | awaiting your decision"
    card "Approved this month | 11 | already decided"
  table "Employee | Date | Merchant | Amount | Status" -> TeamClaimDetail
    row "Dana Ortiz | Oct 1, 2026 | Downtown Diner | $42.50 | Pending"
    row "Raj Patel | Sep 30, 2026 | Rideshare Co | $23.10 | Pending"

screen TeamClaimDetail "Manager views a claim and its receipt before deciding"
  navbar "ExpenseClaims"
  sidebar "Team Queue -> TeamQueue"
  breadcrumb "Team Queue / Downtown Diner"
  row
    heading "Downtown Diner"
    badge "Pending" warning
  text "Dana Ortiz — Oct 1, 2026 — $42.50 — Meals"
  image "Receipt"
  textarea "Reason — required if rejecting"
  row
    right
    button "Reject" danger -> TeamQueue
    button "Approve" primary -> TeamQueue

screen PayrollExport "Finance exports approved claims that have not yet been sent to payroll"
  navbar "ExpenseClaims"
  sidebar "Payroll Export -> PayrollExport"
  row
    heading "Payroll Export"
    right
    button "Export" primary  // in place — downloads a CSV and marks the listed claims exported
  card "Ready to export | 7 | approved claims not yet exported"
  table "Employee | Date | Merchant | Amount"
    row "Dana Ortiz | Sep 25, 2026 | Office Depot | $64.99"
    row "Raj Patel | Sep 22, 2026 | Metro Transit | $18.00"

flow "My claims"
  role "Employee"
  description "An employee submits expense claims and tracks their status"
  MyClaims
  NewClaim
  ClaimDetail

flow "Approval queue"
  role "Manager"
  description "A manager reviews and decides on their team's claims"
  TeamQueue
  TeamClaimDetail

flow "Payroll export"
  role "PayrollExporter"
  description "Finance exports approved claims to payroll"
  PayrollExport
