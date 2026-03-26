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