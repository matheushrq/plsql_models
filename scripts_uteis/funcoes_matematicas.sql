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