Feature: F4 Notifications

  @story-F4.1
  Rule: A manager is notified in-app when one of their team submits a claim

    Scenario: Submission notifies the manager
      Given Priya the employee reports to Morgan the manager
      When Priya submits a claim for "Downtown Diner"
      Then Morgan has a new in-app notification about Priya's claim

  @story-F4.2
  Rule: An employee is notified in-app when their claim is approved or rejected

    Scenario: Approval notifies the employee
      Given Priya the employee has a pending claim for "Downtown Diner"
      When her manager approves the claim
      Then Priya has a new in-app notification that her claim was approved

    Scenario: Rejection notifies the employee
      Given Priya the employee has a pending claim for "Downtown Diner"
      When her manager rejects the claim with a reason
      Then Priya has a new in-app notification that her claim was rejected
