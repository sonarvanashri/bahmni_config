select concat(pn.given_name,' ',pn.family_name)AS 'Patient Name',pi.identifier AS 'Identifier',
pi2.identifier AS 'National ID',d.gender AS 'Gender',d.birthdate AS 'DOB',timestampdiff(year,d.birthdate,d.date_created) AS 'Age',
pa.address3 AS 'Tehsil',pa.city_village AS 'Village',
pa.county_district AS 'District',pa.state_province AS 'State',
vt.name AS 'Visit type',
 case when count(vi.visit_id)=1 then 'New' else 'Existing' end as 'Patient type'
 from patient p
inner join person_name pn on p.patient_id=pn.person_id
inner join patient_identifier pi on p.patient_id=pi.patient_id and pi.identifier_type=3
inner join patient_identifier pi2 on p.patient_id=pi2.patient_id and pi2.identifier_type=4
inner join person d on p.patient_id=d.person_id 
inner join person_address pa on p.patient_id=pa.person_id
inner join visit vi on p.patient_id=vi.patient_id
inner join visit_type vt on vt.visit_type_id=vi.visit_type_id
where p.date_created between '2020-01-01' and '2020-01-31'
group by p.patient_id;
