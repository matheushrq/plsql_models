select  j.job_id,
        j.job_title,
        to_char(jh.start_date, 'DD/MM/YYYY') start_date,
        case
            when extract(year from jh.start_date) <= 2000
                then 'Século 20'
            else 'Século 21'
        end seculo,
        to_char(jh.end_date, 'DD/MM/YYYY') end_date,
        j.max_salary,
        case
            when j.max_salary < 10000
                then 'Abaixo do teto'
            when j.max_salary between 10000 and 15000
                then 'Dentro do teto'
            when j.max_salary > 15000
                then 'Acima do teto'
            else null
        end limite
from    jobs j
join    job_history jh
on      jh.job_id = j.job_id
order   by end_date desc
fetch   first 50 rows only; -- equivalente ao 'top' no sql server e 'limit' no mysql