select concat(pn.given_name,' ',pn.family_name)AS 'Patient Name',pi.identifier AS 'Identifier',
cv.concept_full_name AS 'Lab Test(Panels)'
from patient p
inner join person_name pn on p.patient_id=pn.person_id
inner join patient_identifier pi on p.patient_id=pi.patient_id and pi.identifier_type=3
inner join orders o on o.patient_id=p.patient_id
inner join concept_view cv on cv.concept_id=o.concept_id and o.order_type_id='3'