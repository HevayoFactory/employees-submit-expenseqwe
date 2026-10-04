Feature: F2 Approvals

  @story-F2.1
  Rule: Only a manager's own direct reports' pending claims appear in their queue

    Scenario: A manager sees their team's pending claims
      Given Priya the employee, who reports to Morgan the manager, has a pending claim for "Downtown Diner"
      When Morgan opens the team queue
      Then Priya's claim for "Downtown Diner" is in the queue

    @negative
    Scenario: A manager does not see another manager's team claims
      Given Dana the employee, who reports to Alex the manager, has a pending claim for "Metro Transit"
      When Morgan the manager, who is not Dana's manager, opens the team queue
      Then Dana's claim for "Metro Transit" is not in the queue

  @story-F2.2
  Rule: A manager views a claim's full details and receipt before deciding

    Scenario: Opening a pending claim
      Given Priya the employee has a pending claim for "Downtown Diner" with a receipt attached
      When Morgan the manager, her manager, opens that claim
      Then Morgan sees its amount, date, merchant, category and receipt

  @story-F2.3
  Rule: Only the employee's own manager may approve their claim

    Scenario: Approving a pending claim
      Given Priya the employee has a pending claim for "Downtown Diner"
      When Morgan the manager, her manager, approves it
      Then the claim's status is "approved"

  @story-F2.4
  Rule: Rejecting a claim always requires a reason

    Scenario: Rejecting a claim with a reason
      Given Priya the employee has a pending claim for "Downtown Diner"
      When Morgan the manager, her manager, rejects it with the reason "Missing itemized receipt"
      Then the claim's status is "rejected" and its reason is "Missing itemized receipt"

    @negative
    Scenario: Rejecting without a reason is refused
      Given Priya the employee has a pending claim for "Downtown Diner"
      When Morgan the manager, her manager, tries to reject it without giving a reason
      Then the claim's status is still "pending"
