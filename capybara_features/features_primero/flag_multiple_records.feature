#JIRA PRIMERO-606

@javascript @primero @search
Feature: Flag Case Records For Attention
  As a Administrator / supervisor, I want to to be able to flag multiple cases records.

  Background:
    And the following cases exist in the system:
      | name     | created_by | sex    | registration_date      | status | unique_identifier                    |
      | Viserys  | primero_cp | male   | 03-Feb-2004            | open   | 21c4cba8-b410-4af6-b349-68c557af3aa9 |
      | Daenerys | primero_cp | female | 03-Feb-2004            | open   | 21c4cba8-b410-4af6-b349-68c557af3aa8 |
      | Aegon    | primero_cp | male   | 03-Feb-2004            | open   | 21c4cba8-b410-4af6-b349-68c557af3aa7 |
    And the following incidents exist in the system:
      | created_by  | date_of_first_report    | status   | unique_identifier                    | incident_total_boys | incident_timeofday         |
      | primero_mrm | 03-Feb-2004             | active   | 21c4cba8-b410-4af6-b349-68c557af3aa9 | 3                   | Afternoon (noon to sunset) |
      | primero_mrm | 03-Feb-2004             | active   | 21c4cba8-b410-4af6-b349-68c557af3aa8 | 3                   | Afternoon (noon to sunset) |
      | primero_mrm | 03-Feb-2004             | active   | 21c4cba8-b410-4af6-b349-68c557af3aa7 | 3                   | Afternoon (noon to sunset) |
    And the following tracing request exist in the system:
     | unique_identifier                     | module_id        | created_by | owned_by   |
     | 21c4cba8-b410-4af6-b349-68c557af3aa9  | primeromodule-cp | primero_cp | primero_cp |
     | 21c4cba8-b410-4af6-b349-68c557af3aa8  | primeromodule-cp | primero_cp | primero_cp |
     | 21c4cba8-b410-4af6-b349-68c557af3aa7  | primeromodule-cp | primero_cp | primero_cp |

  Scenario Outline: As a logged in user, I select multiple cases and flag them.
    Given I am logged in as an admin with username <user> and password "primero"
    When I access <page>
    And I check the "7af3aa9" field
    And I check the "7af3aa7" field
    And I press the "Flag" span
    And I click on the link with text "Flag"
    And I should see a browser popup with text "Please explain why you are flagging these records."
    And I click OK in the browser popup
    And I fill in "Flag Reason" with "Some reason"
    And I fill in "Date (optional)" with "today's date"
    And I click on the link with text "Flag"
    And the record for "7af3aa9" should display a "bookmark" icon beside it
    And the record for "7af3aa7" should display a "bookmark" icon beside it
    And the record for "7af3aa8" should not display a "bookmark" icon beside it

    Examples:
      | page                  | user          |
      | cases page            | "primero_cp"  |
      | incidents page        | "primero_mrm" |
      | tracing requests page | "primero_cp"  |

  Scenario Outline: I must select at least one record to flag
    Given I am logged in as an admin with username <user> and password "primero"
    When I access <page>
    And I press the "Flag" span
    And I fill in "Flag Reason" with "Some reason"
    And I fill in "Date (optional)" with "today's date"
    And I click on the link with text "Flag"
    And I should see a browser popup with text "Please select one or more records to flag."
    And I click OK in the browser popup

    Examples:
      | page                  | user          |
      | cases page            | "primero_cp"  |
      | incidents page        | "primero_mrm" |
      | tracing requests page | "primero_cp"  |

  Scenario Outline: I can select all records
    Given I am logged in as an admin with username <user> and password "primero"
    When I access <page>
    And I check the "select_all_records" field
    And I press the "Flag" span
    And I fill in "Flag Reason" with "Some reason"
    And I fill in "Date (optional)" with "today's date"
    And I click on the link with text "Flag"
    And the record for "7af3aa9" should display a "bookmark" icon beside it
    And the record for "7af3aa7" should display a "bookmark" icon beside it
    And the record for "7af3aa8" should display a "bookmark" icon beside it

    Examples:
      | page                  | user          |
      | cases page            | "primero_cp"  |
      | incidents page        | "primero_mrm" |
      | tracing requests page | "primero_cp"  |

  Scenario Outline: Select All option should apply to all records from all pages
    Given I am logged in as an admin with username <user> and password "primero"
    And 50 <model> sample records exists created by <user>
    When I access <page>
    And I check the "select_all_records" field
    And all the records on the page should be selected
    And I visit cases page "2"
    And all the records on the page should be selected
    And I visit cases page "3"
    And all the records on the page should be selected
    And I visit cases page "1"
    And I sort the records by "ID#"
    And I uncheck "select_all_records"
    And I select all the records on the page
    And I press the "Flag" span
    And I fill in "Flag Reason" with "Testing"
    And I fill in "Date (optional)" with "today's date"
    And I click on the link with text "Flag"
    And all the records on the page should be flagged
    And I visit cases page "2"
    And I select all the records on the page
    And I press the "Flag" span
    And I fill in "Flag Reason" with "Testing"
    And I fill in "Date (optional)" with "today's date"
    And I click on the link with text "Flag"
    And all the records on the page should be flagged
    And I check the "Flagged?" field
    And I press the "Apply Filter" link
    And I check the "select_all_records" field
    And I press the "Flag" span
    And I fill in "Flag Reason" with "Testing"
    And I fill in "Date (optional)" with "today's date"
    And I click on the link with text "Flag"
    And all the records on the page should be flagged "2" times
    And I access <page>
    And I sort the records by "ID#"
    And all the records on the page should be flagged "2" times
    And I visit cases page "2"
    And all the records on the page should be flagged "2" times
    And I visit cases page "3"
    And the record for "0000041" should not display a "bookmark" icon beside it
    And the record for "0000042" should not display a "bookmark" icon beside it
    And the record for "0000043" should not display a "bookmark" icon beside it
    And the record for "0000044" should not display a "bookmark" icon beside it
    And the record for "0000045" should not display a "bookmark" icon beside it
    And the record for "0000046" should not display a "bookmark" icon beside it
    And the record for "0000047" should not display a "bookmark" icon beside it
    And the record for "0000048" should not display a "bookmark" icon beside it
    And the record for "0000049" should not display a "bookmark" icon beside it
    And the record for "0000050" should not display a "bookmark" icon beside it

    Examples:
      | model            | user          | page                  |
      | cases            | "primero_cp"  | cases page            |
      | incidents        | "primero_mrm" | incidents page        |

  Scenario Outline: Select All option should apply to all records from all pages in tracing requests
    Given I am logged in as an admin with username <user> and password "primero"
    And 50 <model> sample records exists created by <user>
    When I access <page>
    And I sort the records by "ID#"
    And I check the "select_all_records" field
    And all the records on the page should be selected
    And I visit cases page "2"
    And all the records on the page should be selected
    And I visit cases page "3"
    And all the records on the page should be selected
    And I press the "Flag" span
    And I fill in "Flag Reason" with "Testing"
    And I fill in "Date (optional)" with "today's date"
    And I click on the link with text "Flag"
    And all the records on the page should be flagged "1" times
    And I visit cases page "2"
    And all the records on the page should be flagged "1" times
    And I visit cases page "1"
    And all the records on the page should be flagged "1" times
    And I uncheck "select_all_records"
    And I select all the records on the page
    And I press the "Flag" span
    And I fill in "Flag Reason" with "Testing"
    And I fill in "Date (optional)" with "today's date"
    And I click on the link with text "Flag"
    And all the records on the page should be flagged "2" times
    And I visit cases page "2"
    And all the records on the page should be flagged "1" times
    And I visit cases page "3"
    And all the records on the page should be flagged "1" times

    Examples:
      | model            | user          | page                  |
      | tracing requests | "primero_cp"  | tracing requests page |