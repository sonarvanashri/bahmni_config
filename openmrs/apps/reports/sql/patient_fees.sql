select concat(pn.given_name,' ',pn.family_name)AS 'Patient Name',pi.identifier AS 'Identifier',
obs.value_numeric AS 'Registration Fees'
from patient p
inner join person_name pn on p.patient_id=pn.person_id
inner join patient_identifier pi on p.patient_id=pi.patient_id and pi.identifier_type=3
inner join obs obs on obs.person_id=p.patient_id and obs.concept_id=117
where p.date_created>=curdate();

