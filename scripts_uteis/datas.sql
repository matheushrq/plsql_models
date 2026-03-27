-- Cálculos com datas
select  last_name,
        round((sysdate - hire_date)/7, 1) semanas_trabalhadas
from    employees;

select  last_name,
        first_name,
        round(months_between(sysdate, hire_date), 2) meses_trabalhados
from    employees;

select  sysdate data_atual,
        add_months(sysdate, 3) tres_meses,
        next_day(sysdate, 'SEXTA-FEIRA') proxima_sexta,
        last_day(sysdate) ultimo_dia_mes
from    dual;

select  sysdate,
        round(sysdate, 'month'),
        round(sysdate, 'year'),
        trunc(sysdate, 'month'),
        trunc(sysdate, 'year')
from    dual;

select  sysdate,
        to_char(trunc(sysdate), 'DD/MM/YYYY HH24:MI:SS')
from    dual;

select  extract(year from sysdate) ano from dual;