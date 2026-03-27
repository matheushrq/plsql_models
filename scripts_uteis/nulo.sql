select  distinct
        last_name || ', ' || first_name nome,
        nvl(department_id, (select department_id from departments order by department_id desc fetch first 1 rows only)) department_id, /* NVL: Correspondente ao ISNULL() no SQL Server */
        salary,
        salary * 12 anual_salary,
        case
            when salary * 12 > 80000
                then 'Senior'
            when salary * 12 between 40000 and 80000
                then 'Mid-level'
            else 'Junior'
        end seniority
from    employees;
-- where   department_id is null
-- order   by salario_anual desc

SELECT nome, NVL(comissao, 0) FROM funcionarios; -- Se a comissão for NULL, exibe 0.