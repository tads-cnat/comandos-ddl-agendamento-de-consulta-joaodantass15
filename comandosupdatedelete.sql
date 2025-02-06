-- Atualizar a data de nascimento de D João VI
UPDATE pacientes SET data_nascimento = '1416-12-01' WHERE nome = 'D João VI';

-- Atualizar telefone e e-mail de Pedro I
UPDATE pacientes SET telefone = '5503', email = 'pf@email.com' WHERE nome = 'Pedro I';

-- Adicionar o dígito "9" ao telefone de todos os pacientes
UPDATE pacientes SET telefone = '9' | telefone WHERE telefone IS NOT NULL;

-- Adiar consultas de 17-05-1783 para 19-05-1783 e atualizar valor para R$150,00
UPDATE agendamentos 
SET data_hora_consulta = '1783-05-19', valor_consulta = 150.00
WHERE data_hora_consulta BETWEEN '1783-05-17 00:00:00' AND '1783-05-17 23:59:59';

-- Remover especialidade "Cardiologista" de JJ Xavier
DELETE FROM especialidades WHERE crm_medico = '112' AND descricao = 'Cardiologista';

-- Remover consulta de Pedro I no dia 17-05-1783
DELETE FROM agendamentos WHERE cpf_paciente = '002' AND data_hora_consulta = '1783-05-17 08:00:00';

-- Remover agendamentos do médico D João VI com custo R$0,00
DELETE FROM agendamentos WHERE crm_medico = '111' AND valor_consulta = 0.00;

-- Remover pacientes que possuem plano de saúde ou que não possuem telefone
DELETE FROM pacientes WHERE plano_saude = TRUE OR telefone IS NULL;

-- Remover médico JJ Xavier da base de dados
DELETE FROM medicos WHERE crm = '112';
