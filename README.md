# Myanmar-HIE
Projectathon project for Myanmar HIE testing

rendered build https://johnmoehrke.github.io/Myanmar-HIE/

overall input requirements document https://onedrive.live.com/edit.aspx?resid=8FE56B9EF4CA82CE%2147394&id=documents&authkey=!AL1yYXKZakGjSEs&

# Patient 

The patient constraints

As a specific requirement, the IPS patient data model will be extended to mandate the following to be persisted, and required if known: 

Patient’s full legal name, date of birth, place of birth, and sex at birth (stored in the gender element) 

Existing ID numbers (e.g. national ID number, driving license number, local clinic ID number(s), etc., where available) 

Patient’s mother’s full legal name, which will be maintained in the patient.link.other data element as a RelatedPerson of type NMTH (natural mother). This field will be required if known, whether she be alive or dead, and will support demographic lookup. 

As a mandatory CR behaviour, the patient.id shall be a globally unique ID (GUID) and the “MOH-assigned” unique health ID shall be of the format 1NN-NNN-NNNN-C where N is an integer and C is a checksum digit. This MOH-assigned ID shall be persisted in the patient.identifier element with MOH denoted as the assigning authority. For context, it is expected that the MOH-assigned identifier would match the identifier (e.g. barcoded unique ID) that appears on a health card where these may be issued by MOH.  

In cases where a unique ID is established for an individual but no ID card is issued at the time of establishing the ID, the patient.id (the GUID) shall be persisted as the patient.identifier. This temporary patient.identifier shall be overwritten by the MOH-issued unique ID at the time a card is issued to the individual. This behaviour is intended to support situations where persons need to be set up with a unique ID but where it is not possible to issue them a card at the time their demographic record is created. 

The CR shall also maintain and persist any and all locally-assigned IDs in the patient.identifier element (e.g. a locally unique medical records number created by a care facility). In these cases, the assigning authority shall be identified using the MOH-assigned care delivery organization’s org ID. These org IDs shall match valid organization.id records (see ILR-FR, below).  

