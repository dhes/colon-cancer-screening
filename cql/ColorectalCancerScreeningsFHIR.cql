library ColorectalCancerScreeningsFHIR version '0.0.003'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.001' called FHIRHelpers

codesystem "ObservationCategoryCodes": 'http://terminology.hl7.org/CodeSystem/observation-category' 

valueset "Acute Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1083' 
valueset "Advanced Illness": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1082' 
valueset "Annual Wellness Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1240' 
valueset "Care Services in Long-Term Residential Facility": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1014' 
valueset "Colonoscopy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1020' 
valueset "CT Colonography": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1038' 
valueset "Dementia Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1510' 
valueset "Discharged to Health Care Facility for Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.207' 
valueset "Discharged to Home for Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.209' 
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307' 
valueset "Fecal Occult Blood Test (FOBT)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1011' 
valueset "FIT DNA": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1039' 
valueset "Flexible Sigmoidoscopy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1010' 
valueset "Frailty Device": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.118.12.1300' 
valueset "Frailty Diagnosis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1074' 
valueset "Frailty Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1088' 
valueset "Frailty Symptom": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1075' 
valueset "Home Healthcare Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1016' 
valueset "Hospice care ambulatory": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1108.15' 
valueset "Malignant Neoplasm of Colon": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1001' 
valueset "Nonacute Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1084' 
valueset "Nursing Facility Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1012' 
valueset "Observation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1086' 
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001' 
valueset "Online Assessments": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1089' 
valueset "Outpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1087' 
valueset "Preventive Care Services - Established Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1025' 
valueset "Preventive Care Services-Initial Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1023' 
valueset "Telephone Visits": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1080' 
valueset "Total Colectomy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1019' 

code "laboratory": 'laboratory' from "ObservationCategoryCodes" display 'laboratory'

context Patient

// DH edited out; used .performed within 5 years of Now() instead
// and Global."Normalize Interval" ( FlexibleSigmoidoscopy.performed ) ends 5 years or less on or before 
// end of "Measurement Period"
define "Flexible Sigmoidoscopy Performed":
  [Procedure: "Flexible Sigmoidoscopy"] FlexibleSigmoidoscopy
    where FlexibleSigmoidoscopy.status = 'completed'
      and FlexibleSigmoidoscopy.performed within 5 years of Now()

define "Colonoscopy Performed":
  [Procedure: "Colonoscopy"] Colonoscopy
    where Colonoscopy.status = 'completed'
      // This CQM login depends on MATGlobalCommonFunctionsFHIR4. 
        // and Global."Normalize Interval" ( Colonoscopy.performed ) ends 10 years or less on or before 
        // end of "Measurement Period"
      // I'll try to  use more basic pattern like: 
      // and Colonoscopy.performed during Interval[Today() - 10 years, Today()]
      and Colonoscopy.performed within 10 years of Now()

define "Total Colectomy Performed":
  [Procedure: "Total Colectomy"] Colectomy
    where Colectomy.status = 'completed'
      // and Global."Normalize Interval" ( Colectomy.performed ) ends on or before 
      // end of "Measurement Period"

define "Fecal Occult Blood Test Performed":
  [Observation: "Fecal Occult Blood Test (FOBT)"] FecalOccultResult
    where FecalOccultResult.status in { 'final', 'amended', 'corrected' }
      // and exists ( FecalOccultResult.category FecalOccultResultCategory
      //    where "laboratory" in FHIRHelpers.ToConcept ( FecalOccultResultCategory ).codes
      // )
      // DH I'm not sure why the above three lines don't work (they produce null when it should be true,
      // ... so try it without the FHIRHelper, like this: 
      and 'laboratory' in FecalOccultResult.category.coding.code.value
      and FecalOccultResult.value is not null
      // and Global."Latest" ( FecalOccultResult.effective ) during "Measurement Period"
      and FecalOccultResult.issued within 1 year of Now()

define "Fecal Immunochemical Test DNA Performed":
  [Observation: "FIT DNA"] FitDNA
    where FitDNA.status in { 'final', 'amended', 'corrected' }
      // and exists ( FitDNA.category FitDNACategory
      //     where "laboratory" in FHIRHelpers.ToConcept ( FitDNACategory ).codes
      // )
      and 'laboratory' in FitDNA.category.coding.code.value
      and FitDNA.value is not null
      // and Global."Latest" ( FitDNA.effective ) 3 years or less on or before 
      // end of "Measurement Period"
      and FitDNA.issued within 3 years of Now()

define "Malignant Neoplasm":
  [Condition: "Malignant Neoplasm of Colon"] ColorectalCancer
    // where Global."Prevalence Period" ( ColorectalCancer ) starts on or before 
    //   end of "Measurement Period"

define "CT Colonography Performed":
  [Observation: "CT Colonography"] Colonography
    where Colonography.status in { 'final', 'amended', 'corrected', 'appended' }
      // and Global."Normalize Interval" ( Colonography.effective ) ends 5 years or less on or before 
      // end of "Measurement Period"
      and 'laboratory' in Colonography.category.coding.code.value
      and Colonography.issued within 5 years of Now()

define AgeInYears:
   AgeInYears()

define Now:
  Now()

define Today:
  Today()

define InDemographic:
  AgeInYears() between 45 and 75 // inclusive

define "Numerator":
  exists "Colonoscopy Performed" or
  exists "Fecal Occult Blood Test Performed" or
  exists "Flexible Sigmoidoscopy Performed" or
  exists "Fecal Immunochemical Test DNA Performed" or
  exists "CT Colonography Performed"

define "Denominator Exclusions":
  // Hospice."Has Hospice"
  exists "Malignant Neoplasm"
  or exists "Total Colectomy Performed"
  // or FrailtyLTI."Advanced Illness and Frailty Exclusion Not Including Over Age 80"
  // or ( AgeInYearsAt(date from start of "Measurement Period")>= 65
      // and FrailtyLTI."Has Long Term Care Periods Longer Than 90 Consecutive Days"
  // )
  // or PalliativeCare."Palliative Care in the Measurement Period"

define NeedsColonoscopy: 
  InDemographic is true and
  Numerator is false and
  "Denominator Exclusions" is false