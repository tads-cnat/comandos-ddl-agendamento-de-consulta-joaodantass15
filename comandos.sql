-- Criar tabela de pacientes
CREATE TABLE pacientes (
    cpf VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    senha VARCHAR(20),
    plano_saude BOOLEAN
);

-- Criar tabela de médicos
CREATE TABLE medicos (
    crm VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

-- Criar tabela de especialidades
CREATE TABLE especialidades (
    id SERIAL PRIMARY KEY,
    crm_medico VARCHAR(20) REFERENCES medicos(crm),
    descricao VARCHAR(100)
);

-- Criar tabela de agendamentos
CREATE TABLE agendamentos (
    id SERIAL PRIMARY KEY,
    cpf_paciente VARCHAR(20) REFERENCES pacientes(cpf),
    crm_medico VARCHAR(20) REFERENCES medicos(crm),
    data_hora_consulta TIMESTAMP,
    data_hora_agendamento TIMESTAMP,
    valor_consulta DECIMAL(10,2)
);
