-- 1.
SELECT e.nome_funcionario, ROUND(e.salario,2) AS salario
FROM Funcionario e
JOIN Departamento dep ON e.id_departamento = dep.id_departamento
WHERE dep.nome_departamento = 'Vendas' AND e.salario > 2500;

-- 2.
SELECT f.nome_funcionario, d.nome_departamento, pr.nome_projeto
FROM Funcionario f
JOIN Departamento d ON f.id_departamento = d.id_departamento
JOIN Funcionario_Projeto fp ON fp.id_funcionario = f.id_funcionario
JOIN Projeto pr ON fp.id_projeto = pr.id_projeto;

-- 3.
SELECT d.nome_departamento, ROUND(AVG(f.salario),2) AS media_salarial
FROM Departamento d
JOIN Funcionario f ON f.id_departamento = d.id_departamento
GROUP BY d.nome_departamento;

-- 4.
SELECT d.nome_departamento, ROUND(AVG(f.salario),2) AS media_salarial
FROM Departamento d
JOIN Funcionario f ON f.id_departamento = d.id_departamento
GROUP BY d.nome_departamento
HAVING AVG(f.salario) > 5000;

-- 5.
SELECT p.nome_projeto, COUNT(DISTINCT fp.id_funcionario) AS qtd_funcionarios
FROM Projeto p
LEFT JOIN Funcionario_Projeto fp ON p.id_projeto = fp.id_projeto
GROUP BY p.nome_projeto;

-- 6.
SELECT func.nome_funcionario, ger.nome_funcionario AS gerente, dept.nome_departamento
FROM Funcionario func
LEFT JOIN Funcionario ger ON func.id_gerente = ger.id_funcionario
JOIN Departamento dept ON func.id_departamento = dept.id_departamento;

-- 7.
SELECT f.nome_funcionario, pr.nome_projeto
FROM Funcionario f
JOIN Funcionario_Projeto fp ON f.id_funcionario = fp.id_funcionario
JOIN Projeto pr ON fp.id_projeto = pr.id_projeto
WHERE f.id_funcionario IN (
    SELECT id_funcionario
    FROM Funcionario_Projeto
    GROUP BY id_funcionario
    HAVING COUNT(id_projeto) > 1
);

-- 8.
SELECT p.nome_projeto
FROM Projeto p
LEFT JOIN Funcionario_Projeto fp ON p.id_projeto = fp.id_projeto
WHERE fp.id_funcionario IS NULL;

-- 9.
SELECT d.nome_departamento, ROUND(SUM(f.salario),2) AS total_salarios
FROM Departamento d
JOIN Funcionario f ON f.id_departamento = d.id_departamento
GROUP BY d.nome_departamento;

-- 10. Quantidade de projetos por funcionário
SELECT f.nome_funcionario, COUNT(fp.id_projeto) AS qtd_projetos
FROM Funcionario f
LEFT JOIN Funcionario_Projeto fp ON f.id_funcionario = fp.id_funcionario
GROUP BY f.nome_funcionario;
