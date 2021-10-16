/* MER_Logico: */

CREATE TABLE Funcionario (
    id int(3) PRIMARY KEY,
    Senha int(6),
    Login int(6),
    Nome varchar(250)
);

CREATE TABLE Reserva (
    Status varchar(15),
    id int(3) PRIMARY KEY,
    fk_Clilentes_id int(3),
    fk_Funcionario_id int(3),
    fk_Hospedagem_id int(3)
);

CREATE TABLE Quarto (
    id int(3) PRIMARY KEY,
    NumLeitos int(3),
    Frigobar int(3),
    Wifi int(3),
    Checkout date,
    Checkin date,
    Status varchar(15),
    fk_tipoQuarto_id int(3),
    fk_Reserva_id int(3)
);

CREATE TABLE tipoQuarto (
    id int(3) PRIMARY KEY,
    Descricao varchar(250)
);

CREATE TABLE Clilentes (
    id int(3) PRIMARY KEY,
    Endereco varchar(250),
    Nome varchar(250),
    Status varchar(15),
    Telefone int(14),
    CPF int(11),
    fk_tipoClientes_id int(3)
);

CREATE TABLE tipoClientes (
    id int(3) PRIMARY KEY,
    Descricao varchar(250)
);

CREATE TABLE Hospedagem (
    Valor_total decimal(15,2),
    Status varchar(15),
    id int(3) PRIMARY KEY
);
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2
    FOREIGN KEY (fk_Clilentes_id)
    REFERENCES Clilentes (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_3
    FOREIGN KEY (fk_Funcionario_id)
    REFERENCES Funcionario (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_4
    FOREIGN KEY (fk_Hospedagem_id)
    REFERENCES Hospedagem (id)
    ON DELETE CASCADE;
 
ALTER TABLE Quarto ADD CONSTRAINT FK_Quarto_2
    FOREIGN KEY (fk_tipoQuarto_id)
    REFERENCES tipoQuarto (id)
    ON DELETE CASCADE;
 
ALTER TABLE Quarto ADD CONSTRAINT FK_Quarto_3
    FOREIGN KEY (fk_Reserva_id)
    REFERENCES Reserva (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Clilentes ADD CONSTRAINT FK_Clilentes_2
    FOREIGN KEY (fk_tipoClientes_id)
    REFERENCES tipoClientes (id)
    ON DELETE CASCADE;