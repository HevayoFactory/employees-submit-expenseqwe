Feature: F1 Submit expenses

  @story-F1.1 @story-F1.4
  Rule: A claim covers a single expense, with an amount, a date, a merchant and a category

    Scenario: Creating a claim with all its fields
      Given Priya the employee is preparing a new expense claim
      When she enters an amount of "42.50", a date of "2026-10-01", a merchant of "Downtown Diner" and a category of "Meals"
      Then the claim shows an amount of "42.50", a date of "2026-10-01", a merchant of "Downtown Diner" and a category of "Meals"

  @story-F1.2
  Rule: A receipt is always required to submit a claim

    @negative
    Scenario: Submitting without a receipt is refused
      Given Priya the employee has filled in a claim's amount, date, merchant and category but attached no receipt
      When she tries to submit the claim
      Then the claim is not submitted

  @story-F1.3
  Rule: An agent pre-fills the claim's amount, date and merchant from the attached receipt

    Scenario: The agent reads an uploaded receipt
      Given Priya the employee has attached a receipt for "Downtown Diner" dated "2026-10-01" for "42.50"
      When the receipt is read
      Then the claim's amount, date and merchant fields are pre-filled from the receipt, ready for Priya to confirm or edit

  @story-F1.5
  Rule: Submitting a claim sends it to the employee's manager for approval

    Scenario: Submitting a complete claim
      Given Priya the employee has a claim with an amount, a date, a merchant, a category and a receipt attached
      When she submits the claim
      Then the claim's status is "pending"

  @story-F1.6
  Rule: Only the submitting employee may edit or withdraw their claim, and only while it is pending

    Scenario: Editing a pending claim
      Given Priya the employee has a pending claim for "Downtown Diner"
      When she changes its amount to "45.00"
      Then the claim's amount is "45.00"

    Scenario: Withdrawing a pending claim
      Given Priya the employee has a pending claim for "Downtown Diner"
      When she withdraws it
      Then the claim no longer appears among her claims

    @negative
    Scenario: A decided claim can no longer be edited
      Given Priya the employee has a claim for "Downtown Diner" that has already been approved
      When she tries to change its amount
      Then the claim's amount is unchanged

  @story-F1.7
  Rule: An employee sees the status of each of their own claims

    Scenario: Viewing claims in different states
      Given Priya the employee has one pending claim, one approved claim and one rejected claim
      When she opens her claims list
      Then she sees one claim marked "pending", one marked "approved" and one marked "rejected"
