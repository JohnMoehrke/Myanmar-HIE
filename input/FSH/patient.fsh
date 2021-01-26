Profile: MyammarPatient
// TODO should be dependent on Patient-uv-ips
//Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Patient-uv-ips
Parent: Patient
Id: MyanmarPatient
Title: "Constraints for Myanmar Patient"
Description: "
As a specific requirement, the IPS patient data model will be extended to mandate the following to be persisted, and required if known: 

Patient’s full legal name, date of birth, place of birth, and sex at birth (stored in the gender element) 

Existing ID numbers (e.g. national ID number, driving license number, local clinic ID number(s), etc., where available) 

Patient’s mother’s full legal name, which will be maintained in the patient.link.other data element as a RelatedPerson of type NMTH (natural mother). This field will be required if known, whether she be alive or dead, and will support demographic lookup. 

As a mandatory CR behaviour, the patient.id shall be a globally unique ID (GUID) and the “MOH-assigned” unique health ID shall be of the format 1NN-NNN-NNNN-C where N is an integer and C is a checksum digit. This MOH-assigned ID shall be persisted in the patient.identifier element with MOH denoted as the assigning authority. For context, it is expected that the MOH-assigned identifier would match the identifier (e.g. barcoded unique ID) that appears on a health card where these may be issued by MOH.  

In cases where a unique ID is established for an individual but no ID card is issued at the time of establishing the ID, the patient.id (the GUID) shall be persisted as the patient.identifier. This temporary patient.identifier shall be overwritten by the MOH-issued unique ID at the time a card is issued to the individual. This behaviour is intended to support situations where persons need to be set up with a unique ID but where it is not possible to issue them a card at the time their demographic record is created. 

The CR shall also maintain and persist any and all locally-assigned IDs in the patient.identifier element (e.g. a locally unique medical records number created by a care facility). In these cases, the assigning authority shall be identified using the MOH-assigned care delivery organization’s org ID. These org IDs shall match valid organization.id records (see ILR-FR, below).  

TODO: not yet based on IPS flavor of Patient

TODO: place of birth does have a FHIR core extension we could use extension-patient-birthplace

TODO: sex at birth is not appropriate in .gender. There is not a known extension. So could create an extension here for regional use

TODO patient's mother's full legal name -- there is an extension that could have been used http://hl7.org/fhir/extension-patient-mothersmaidenname.html
but the text indicates that patient.link.other is used and that it points at a RelatedPerson. Given that RelatedPerson is not part of PMIR, the addition of RelatedPerson would be an extension on PMIR.  so unclear direction should go.

TODO: do not have a slice constraint forcing the MOH identifier 

"
// TODO place of birth is not part of core Patient, but there is an extension available for it
// http://hl7.org/fhir/extension-patient-birthplace.html
// TODO sex at birth -- this is not appropriate to store in .gender, as .gender is defined as "administrative gender". I do not find an extension for this, so one could be created here?
// TODO patient's mother's full legal name -- there is an extension that could have been used http://hl7.org/fhir/extension-patient-mothersmaidenname.html
// but the text indicates that patient.link.other is used and that it points at a RelatedPerson. Given that RelatedPerson is not part of 
* name 1..*
* birthDate 1..1
// TODO identifier must have a MOH system value (and the value must be GUID)

ValueSet: ValuesetBirthsex
* include codes from system http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender


Extension: BirthSex
Id: BirthSex
Title: "The patient sex at birth"
// replicated what I see in the US-Core
* value[x] only code 
* valueCode from ValuesetBirthsex (required)

Instance: ex-simplePatient
InstanceOf: MyanmarPatient
Title: "Simple patient example"
Description: " This is John Jacob Jingleheimer Schmidt

 history - http://playgroundjungle.com/2018/02/origins-of-john-jacob-jingleheimer-schmidt.html
"
* id = "9b284fd5-b7a8-4cc8-bc1c-bc5563d698b0"
* identifier.value = "9b284fd5-b7a8-4cc8-bc1c-bc5563d698b0"
* identifier.system = "urn:MOH"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name[+].use = #usual
* name[=].family = "Smith"
* name[=].given = "John"
* name[+].use = #old
* name[=].family = "Schnidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingle"
* name[=].given[+] = "Heimer"
* name[=].period.end = "1960"
* name[+].use = #official
* name[=].family = "Smith"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingleheimer"
* name[=].period.start = "1960-01-01"
* name[+].use = #nickname
* name[=].family = "Smith"
* name[=].given = "Jack"
* gender = #other
* birthDate = "1923-07-25"
* address.state = "WI"
* address.country = "USA"
* extension[mothersMaidenName].valueString = "Smith"
* extension[BirthSex].valueCode = #F
