select  e.first_name,
        e.last_name,
        d.department_name,
        d.department_id
from    employees e
join    departments d
on      d.department_id = e.department_id;

select  case
            when d.department_name = 'Human Resources'
                then 'RH'
            when d.department_name = 'Public Relations'
                then 'Relações Públicas'
            when d.department_name = 'Accounting'
                then 'Contas a pagar'
            when d.department_name = 'Administration'
                then 'Gerência'
            when d.department_name = 'Shipping'
                then 'Departamento de Compras'
            else d.department_name
        end departamento,
        count(e.employee_id) funcionario_setor
from    departments d
join    employees e
on      e.department_id = d.department_id
group   by d.department_name
order   by funcionario_setor DESC;

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

describe jobs

select  distinct
        first_name,
        last_name,
        first_name || ' ' || last_name "Nome Completo",
        upper(last_name) || ', ' || first_name "Nome formato americano",
        job_id,
        to_char(hire_date, 'DD/MM/YYYY') hire_date
from    employees
where   extract(year from hire_date) = 2005
and     first_name like 'A%'
order   by hire_date desc;

select  distinct
        last_name,
        job_id,
        department_id,
        hire_date
from    employees
order   by hire_date asc;

select  distinct
        last_name,
        job_id,
        department_id,
        hire_date
from    employees
order   by hire_date DESC;

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

select  last_name,
        salary
from    employees
where   employee_id = &employee_id; -- & abre uma caixa de digitação para digitar o valor

/* -- Comando DEFINE e UNDEFINE -- */
define  employee_id = 101;

select  *
from    employees
where   employee_id = &employee_id;

define  employee_id;
undefine employee_id;

/* 
    Funções Single Row: upper, lower e initcap
    - upper(): FUNÇÃO
    - lower(): função
    - initcap(): Função
*/

select  distinct
        last_name,
        first_name,
        employee_id,
        hire_date
from    employees
where   last_name = 'KING'; 
/*
    A sintaxe é case sensitive, então a pesquisa é feita de acordo com como que ela é passada.
    Nesse caso, foi pesquisado se existe registro 'KING' com todas as letras maiúsculas.
    
    Para não haver distinção, uma opção é utilizar a função upper().
*/

select  distinct
        last_name,
        first_name,
        employee_id,
        hire_date
from    employees
where   upper(last_name) = 'KING';

/-- Manipulação de caracteres -- /
select  concat(' Curso: ','Introdução Oracle 19c') fun_concat,
        substr('Introdução Oracle 19c', 1, 11) fun_substr,
        length('Introdução Oracle 19c') fun_length,
        instr('Introdução ORACLE 19c', 'ORACLE') fun_instr
from    dual;

select  lpad('Introdução Oracle 19c', 30, '*') fun_lpad,
        rpad('Introdução Oracle 19c', 30, '*') fun_rpad,
        replace('Introdução Oracle 12c', '12c', '19c') fun_replace,
        --trim(';','nome@gmail.com;') fun_trim,
        rtrim('nome@gmail.com;',';') fun_rtrim,
        ltrim('   nome@gmail.com', ' ') fun_ltrim
from    dual;

-- Funções numéricas
select  round(43.591, 2),
        round(43.591, 0),
        trunc(43.591, 2),
        trunc(43.591, 0)
from    dual;

-- mod: resto da divisão
select  mod(1300, 600)
from    dual;

-- abs: valor absoluto
select  abs(-9)
from    dual;

-- sqrt: raiz quadrada
select  sqrt(49)
from    dual;

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
from    dual