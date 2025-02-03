
CREATE TABLE Pessoa (
    cpf CHAR(11) PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    nome VARCHAR(150) NOT NULL,
    data_nasc DATE NOT NULL,
    endereco VARCHAR(300) NOT NULL,
    telefone VARCHAR(15),
    CONSTRAINT unique_email_nome UNIQUE (email, nome)
);


CREATE TABLE Paciente (
    cpf_pessoa CHAR(11) PRIMARY KEY,
    senha VARCHAR(10) NOT NULL CHECK (LENGTH(senha) BETWEEN 5 AND 10),
    plano_saude BOOLEAN NOT NULL,
    FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
);


CREATE TABLE Medico (
    cpf_pessoa CHAR(11) PRIMARY KEY,
    crm VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
);


CREATE TABLE Especialidade (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);


CREATE TABLE Medico_Especialidade (
    cpf_medico CHAR(11),
    id_especialidade INT,
    PRIMARY KEY (cpf_medico, id_especialidade),
    FOREIGN KEY (cpf_medico) REFERENCES Medico(cpf_pessoa),
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id)
);


CREATE TABLE Agendamento (
    cpf_paciente CHAR(11),
    cpf_medico CHAR(11),
    dh_consulta TIMESTAMP NOT NULL,
    dh_agendamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_consulta DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (cpf_paciente, cpf_medico, dh_consulta),
    FOREIGN KEY (cpf_paciente) REFERENCES Paciente(cpf_pessoa),
    FOREIGN KEY (cpf_medico) REFERENCES Medico(cpf_pessoa)
);
