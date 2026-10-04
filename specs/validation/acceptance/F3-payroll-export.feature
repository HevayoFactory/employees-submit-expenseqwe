Feature: F3 Payroll export

  @story-F3.1
  Rule: Finance sees every approved claim that has not yet been exported

    Scenario: Viewing claims ready for export
      Given there is an approved claim for "Office Depot" that has not been exported
      When Casey from finance opens the payroll export page
      Then the claim for "Office Depot" is listed as ready to export

    @negative
    Scenario: An already-exported claim is not listed
      Given there is an approved claim for "Office Depot" that was already exported
      When Casey from finance opens the payroll export page
      Then the claim for "Office Depot" is not listed

  @story-F3.2
  Rule: Finance exports the ready claims as a downloadable file whenever they choose

    Scenario: Exporting on demand
      Given there are two approved, unexported claims
      When Casey from finance exports them
      Then a downloadable payroll file containing those two claims is produced

  @story-F3.3
  Rule: An exported claim is never included in a later export

    Scenario: A second export does not repeat an earlier one
      Given Casey from finance has already exported a claim for "Office Depot"
      When Casey exports again
      Then the file produced does not contain the claim for "Office Depot"
