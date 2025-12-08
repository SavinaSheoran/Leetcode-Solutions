select p.patient_id, p.patient_name, p.age, datediff(min(c1.test_date) , min(c.test_date)) as recovery_time

from covid_tests c

join covid_tests c1 
on c.patient_id = c1.patient_id 
and c.test_date < c1.test_date 
and c.result = 'Positive'
and c1.result = 'Negative'

join patients p 
on c.patient_id = p.patient_id

group by p.patient_id, p.patient_id, p.age
order by recovery_time asc, p.patient_name asc;