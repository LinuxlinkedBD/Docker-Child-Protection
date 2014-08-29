gbv_individual_details_fields = [
  Field.new({"name" => "survivor_code",
             "type" => "text_field",
             "display_name_all" => "Survivor Code",
            }),
  Field.new({"name" => "sex",
             "type" => "select_box",
             "display_name_all" => "What is the sex of the child?",
             "option_strings_text_all" =>
                          ["Female",
                           "Male",
                           "Unknown"].join("\n")
            }),
  Field.new({"name" => "date_of_birth",
             "type" => "date_field",
             "display_name_all" => "What is the child's Date of Birth?",
            }),
  Field.new({"name" => "age",
             "type" => "numeric_field",
             "display_name_all" => "What is the child's age?",
            }),
  Field.new({"name" => "estimated",
             "type" => "radio_button",
             "display_name_all" => "Is the age estimated?",
             "option_strings_text_all" => ["Yes", "No"].join("\n")
            }),
  Field.new({"name" => "ethnicity",
             "type" => "select_box",
             "display_name_all" => "What is the ethnic affiliation of the individual?",
             "option_strings_source" => "lookup Ethnicity"
            }),
  Field.new({"name" => "nationality",
             "type" => "select_box",
             "display_name_all" => "What is the national affiliation of the individual?",
             "option_strings_source" => "lookup Nationality"
            }),
  Field.new({"name" => "religion",
             "type" => "select_box",
             "display_name_all" => "What is the religious affiliation of the individual?",
             "option_strings_source" => "lookup Religion"
            }),
  Field.new({"name" => "country_of_origin",
             "type" => "select_box",
             "display_name_all" => "Country of Origin",
             "option_strings_source" => "lookup Country"
            }),
              
  Field.new({"name" => "displacement_at_time_of_incident",
             "type" => "select_box",
             "display_name_all" => "What was the status of the child at the time of the violation?",
             "option_strings_text_all" =>
                          ["Community Member",
                           "IDP",
                           "Refugee",
                           "Returnee",
                           "Unknown"].join("\n")
            }),
  Field.new({"name" => "displacement_status",
             "type" => "select_box",
             "display_name_all" => "Displacement Status at time of report",
             "option_strings_text_all" =>
                          ["Resident",
                           "IDP",
                           "Refugee",
                           "Stateless Person",
                           "Returnee",
                           "Foreign National",
                           "Asylum Seeker",
                           "N/A"].join("\n")
            }),
  Field.new({"name" => "care_arrangements_at_time_of_incident",
             "type" => "select_box",
             "display_name_all" => "What were the care arrangements for the child at the time of the incident/violation(s)?",
             "option_strings_text_all" =>
                          ["Both Parents",
                           "Lone Parent",
                           "Other Family",
                           "Foster Family",
                           "Care Home",
                           "Independent Living",
                           "Other",
                           "Unknown"].join("\n")
            }),
  Field.new({"name" => "child_consent_data_sharing",
             "type" => "select_box",
             "display_name_all" => "With whom is the child and/or adult caregiver willing to share their name and other personal details?",
             "option_strings_text_all" =>
                          ["Anonymous",
                           "Agency Only",
                           "Task Force",
                           "Perpetrator",
                           "Prosecutor"].join("\n")
            }),
  Field.new({"name" => "child_consent_follow_up",
             "type" => "radio_button",
             "display_name_all" => "Is the child and/or adult caregiver willing to be contacted again about the violations?",
             "option_strings_text_all" =>
                          ["Yes", "No"].join("\n")
            }),
  Field.new({"name" => "child_consent_referral",
             "type" => "radio_button",
             "display_name_all" => "Does the Child/Adult Caregiver consent to their personal details being passed to another humanitarian agency willing and able to provide long term support?",
             "option_strings_text_all" =>
                          ["Yes", "No"].join("\n")
            }),
  Field.new({"name" => "create_case",
             "type" => "radio_button",
             "display_name_all" => "Should a case be created for this child to receive further services?",
             "option_strings_text_all" =>
                          ["Yes", "No"].join("\n")
            }),
  Field.new({"name" => "maritial_status",
             "type" => "select_box",
             "display_name_all" => "Current civil/marital status",
             "option_strings_text_all" =>
                          ["Single",
                           "Married/Cohabitating",
                           "Divorced/Separated",
                           "Widowed"].join("\n")
            }),
  Field.new({"name" => "disability_type",
             "type" => "select_box",
             "display_name_all" => "Disability Type",
             "option_strings_text_all" =>
                          ["Mental Disability",
                           "Physical Disability",
                           "Both"].join("\n")
            }),
  Field.new({"name" => "unaccompanied_separated_status",
             "type" => "select_box",
             "display_name_all" => "Is the client an Unaccompanied Minor, Separated Child, or Other Vulnerable Child?",
             "option_strings_text_all" =>
                          ["No",
                           "Unaccompanied Minor",
                           "Separated Child",
                           "Other Vulnerable Child"].join("\n")
            })
]

FormSection.create_or_update_form_section({
  :unique_id => "gbv_individual_details",
  :parent_form=>"incident",
  "visible" => true,
  :order_form_group => 50,
  :order => 15,
  :order_subform => 0,
  :form_group_name => "GBV Individual Details",
  "editable" => true,
  :fields => gbv_individual_details_fields,
  :perm_enabled => true,
  "name_all" => "GBV Individual Details",
  "description_all" => "GBV Individual Details"
})