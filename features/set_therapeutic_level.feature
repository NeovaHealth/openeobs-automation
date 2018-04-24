# JIRA: EOBS-2106
# Scenarios covered: 1-10

Feature: Setting of patient's therapeutic level

  Background: A shift coordinator and patient exist
    Given the user Shirley exists
    And user Shirley has the role of Shift Coordinator
    And the user Shirley is allocated to Oak Ward of Greenfield University Hospital

    And the patient Patricia is in Bed One of Oak Ward
    And the patient Patrick is in Bed Two of Oak Ward

    And the user Shirley logs into the desktop app
    And the user Shirley views the patient Patricia

  Scenario: The title 'Set Therapeutic Obs Level' is displayed
    Given the user Shirley selects the Set Therapeutic Obs Level option
    Then The title Set Therapeutic Obs Level is displayed

  Scenario: Level field is appropriately labelled
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 1 is selected for the therapeutic observation level field
    Then a field labelled Observation Level is visible

  Scenario: A new observation level can be chosen for the patient
    Given the user Shirley selects the Set Therapeutic Obs Level option
    Then a new observation level can be chosen for the patient
    | therapeutic level |
    |                   |
    | Level 1           |
    | Level 2           |
    | Level 3           |
    | Level 4           |

  Scenario: Frequency field is visible and appropriately labelled on level 1
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 1 is selected for the therapeutic observation level field
    Then a field labelled Observation Recording Frequency is visible

  Scenario: Frequency field is visible and appropriately labelled on level 2
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 2 is selected for the therapeutic observation level field
    Then a field labelled Observation Recording Frequency is visible

  Scenario: Frequency field is visible and appropriately labelled on level 3
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 3 is selected for the therapeutic observation level field
    Then a field labelled Observation Recording Frequency is visible

  Scenario: Frequency field is visible and appropriately labelled on level 4
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 4 is selected for the therapeutic observation level field
    Then a field labelled Observation Recording Frequency is visible

  Scenario: Frequency is set to 'Every Hour' when level 1 is selected
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 1 is selected for the therapeutic observation level field
    Then the observation frequency field is set to Every Hour
    And the observation frequency field cannot be modified

  Scenario: Frequency is set to 'Every Hour' when level 3 is selected
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 3 is selected for the therapeutic observation level field
    Then the observation frequency field is set to Every Hour
    And the observation frequency field cannot be modified

  Scenario: Frequency is set to 'Every Hour' when level 4 is selected
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 4 is selected for the therapeutic observation level field
    Then the observation frequency field is set to Every Hour
    And the observation frequency field cannot be modified

  Scenario: A frequency can be chosen for the patient when level 2 is selected
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 2 is selected for the therapeutic observation level field
    Then a frequency can be chosen for the patient's therapeutic observations
    | frequency        |
    |                  |
    | Every 5 Minutes  |
    | Every 10 Minutes |
    | Every 15 Minutes |
    | Every 20 Minutes |
    | Every 25 Minutes |
    | Every 30 Minutes |
    | Every Hour       |

  Scenario: Staff-to-patient ratio field is appropriately labelled
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 1 is selected for the therapeutic observation level field
    Then a field labelled Staff to patient ratio is visible

  Scenario: A staff-to-patient ratio can be chosen for the patient on level 3
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 3 is selected for the therapeutic observation level field
    Then a staff-to-patient ratio can be chosen for the patient's therapeutic observations
    | staff-to-patient ratio |
    |                        |
    | 1:1                    |
    | 2:1                    |
    | 3:1                    |

  Scenario: Changes made are saved on level 2
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 2 is selected for the therapeutic observation level field
    And Every 15 Minutes is selected for the therapeutic observation frequency field
    And the therapeutic level changes are saved
    Then the therapeutic observation level for patient Patricia is level 2
    And the therapeutic observation frequency for patient Patricia is Every 15 Minutes
    And the staff-to-patient ratio for patient Patricia is not set

  Scenario: Changes made are saved on level 3
    Given the user Shirley selects the Set Therapeutic Obs Level option
    When level 3 is selected for the therapeutic observation level field
    And 2:1 is selected for the staff-to-patient ratio field
    And the therapeutic level changes are saved
    Then the therapeutic observation level for patient Patricia is level 3
    And the therapeutic observation frequency for patient Patricia is Every Hour
    And the staff-to-patient ratio for patient Patricia is 2:1
