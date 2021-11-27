- create troubleshooting card to expose inclusion and exclusion details for statin-us, like

//pseudocode?
define InclustionCriteria: 
  List{
    if MostRecentValidLDLResult > 130 'mg/dL' then '- Most recent LDL > 130' else null, 
    if MostRecentValidHDLResult < 40 'mg/dL' then '- Most recent HDL < 40' else null,
    if HasDiabetes then '- Has diabetes' else null,
    if HasHypertension then '- Has hypertension' else null,
    if IsSmoker then 'Is a smoker' else null
  }