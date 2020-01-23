select concat(pn.given_name,' ',pn.family_name)AS 'Patient Name',pi.identifier AS 'Identifier',
pi2.identifier AS 'National ID',d.gender AS 'Gender',d.birthdate AS 'DOB',timestampdiff(year,d.birthdate,d.date_created) AS 'Age',
pa.address3,pa.city_village,
pa.county_district,pa.state_province,
GROUP_CONCAT(DISTINCT(case when pat2.person_attribute_type_id=16 then pat2.value else null end), ' ') as "Secondary Contact",
GROUP_CONCAT(DISTINCT(case when pat.person_attribute_type_id=11 then cv.concept_full_name else null end), ' ') as "Caste",
GROUP_CONCAT(DISTINCT(case when pat.person_attribute_type_id=13 then cv.concept_full_name else null end), ' ') as 'Education',
GROUP_CONCAT(DISTINCT(case when pat.person_attribute_type_id=14  then cv.concept_full_name else null end), ' ') as 'Occupation',
GROUP_CONCAT(DISTINCT(case when pat.person_attribute_type_id=12 then cv.concept_full_name else null end), ' ') as 'Class'
from patient p
inner join person_name pn on p.patient_id=pn.person_id
inner join patient_identifier pi on p.patient_id=pi.patient_id and pi.identifier_type=3
inner join patient_identifier pi2 on p.patient_id=pi2.patient_id and pi2.identifier_type=4
inner join person d on p.patient_id=d.person_id 
inner join person_address pa on p.patient_id=pa.person_id
left join person_attribute pat on p.patient_id=pat.person_id
left join person_attribute pat2 on p.patient_id=pat2.person_id
inner join concept_view cv on cv.concept_id=pat.value
group by p.patient_id;

