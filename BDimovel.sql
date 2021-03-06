create database BDimovel;
use BDimovel;
set foreign_key_checks = 0;

CREATE TABLE faixa_imovel(

cd_faixa INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_faixa VARCHAR(100) NOT NULL,
vl_minimo DECIMAL(8,2) NOT NULL,
vl_maximo DECIMAL(8,2) NOT NULL


);

CREATE TABLE estado(

sg_estado VARCHAR(2) NOT NULL PRIMARY KEY,
nm_estado VARCHAR(100) NOT NULL

);

CREATE TABLE cidade(

cd_cidade INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_cidade VARCHAR(100) NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
FOREIGN KEY(sg_estado)
REFERENCES estado(sg_estado)
);


CREATE TABLE bairro(

cd_bairro INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_bairro VARCHAR(100) NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
cd_cidade INTEGER NOT NULL,
FOREIGN KEY(cd_cidade)
REFERENCES cidade(cd_cidade),
FOREIGN KEY(sg_estado)
REFERENCES estado(sg_estado)

);

CREATE TABLE compradores(

cd_comprador INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_comprador VARCHAR(100) NOT NULL,
nm_enderecoComprador VARCHAR(100) NOT NULL,
nr_cpfComprador VARCHAR(100) NOT NULL,
tel_comprador VARCHAR(100) NOT NULL,
cd_cidade INTEGER NOT NULL,
cd_bairro INTEGER NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
FOREIGN KEY (cd_cidade)
REFERENCES cidade(cd_cidade),
FOREIGN KEY (cd_bairro)
REFERENCES bairro(cd_bairro),
FOREIGN KEY (sg_estado)
REFERENCES estado(sg_estado)

);

CREATE TABLE vendedor(

cd_vendedor INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_vendedor VARCHAR(100) NOT NULL,
nm_endereco VARCHAR(100) NOT NULL,
nr_cpfVendedor VARCHAR(100) NOT NULL,
tel_vendedor VARCHAR(100) NOT NULL,
data_nascVendedor DATE NOT NULL,
cd_cidade INTEGER NOT NULL,
cd_bairro INTEGER NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
FOREIGN KEY (cd_cidade)
REFERENCES cidade(cd_cidade),
FOREIGN KEY (cd_bairro)
REFERENCES bairro(cd_bairro),
FOREIGN KEY (sg_estado)
REFERENCES estado(sg_estado)

);


CREATE TABLE imovel(

cd_imovel INTEGER NULL PRIMARY KEY auto_increment,
nm_endereco VARCHAR(100) NOT NULL,
nr_areautil DECIMAL(8,2) NOT NULL,
Nr_areatotal DECIMAL(8,2) NOT NULL,
vl_preco DECIMAL(10,2) NOT NULL,
st_vendido VARCHAR(100) NOT NULL,
data_lancto DATE NOT NULL,
cd_comprador INTEGER NOT NULL,
cd_vendedor INTEGER NOT NULL,
cd_bairro INTEGER NOT NULL,
cd_cidade INTEGER NOT NULL,
cd_oferta INTEGER NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
FOREIGN KEY (cd_vendedor)
REFERENCES vendedor(cd_vendedor),
FOREIGN KEY (cd_bairro)
REFERENCES bairro(cd_bairro),
FOREIGN KEY (sg_estado)
REFERENCES estado(sg_estado),
FOREIGN KEY(cd_comprador)
REFERENCES compradores(cd_comprador),
FOREIGN KEY (cd_cidade)
REFERENCES cidade(cd_cidade)

);

CREATE TABLE oferta(

cd_oferta INTEGER NULL PRIMARY KEY auto_increment,
vl_oferta DECIMAL(8,2) NOT NULL,
dt_oferta DATE,
cd_imovel INTEGER NOT NULL,
cd_comprador INTEGER NOT NULL,
FOREIGN KEY (cd_comprador)
REFERENCES compradores(cd_comprador),
FOREIGN KEY (cd_imovel)
REFERENCES imovel(cd_imovel)

);

ALTER TABLE imovel
ADD FOREIGN KEY(cd_oferta)
REFERENCES oferta(cd_oferta);


INSERT INTO estado (sg_estado, nm_estado) VALUES 
	('AC', 'Acre'),
    ('AL', 'Alagoas'),
    ('AP', 'Amap??'),
    ('AM', 'Amazonas'),
    ('BA', 'Bahia'),
    ('CE', 'Cear??'),
    ('ES', 'Esp??rito Santo'),
    ('GO', 'Goi??s'),
    ('MA', 'Maranh??o'),
    ('MT', 'Mato Grosso '),
    ('MS', 'Mato Grosso do Sul'),
    ('MG', 'Minas Gerais'),
    ('PA', 'Par??'),
    ('PB', 'Para??ba'),
    ('PR', 'Paran??'),
    ('PE', 'Pernambuco'),
    ('PI', 'Piau??'),
    ('RJ', 'Rio de Janeiro'),
    ('RN', 'Rio Grande do Norte'),
    ('RS', 'Rio Grande do Sul'),
    ('RO', 'Rond??nia'),
    ('RR', 'Roraima'),
    ('SC', 'Santa Catarina'),
    ('SP', 'S??oPaulo'),
    ('SE', 'Sergipe'),
    ('TO', 'Tocantins'),
    ('DF', 'Distrito Federal');
    

    
INSERT INTO cidade (nm_cidade, sg_estado) VALUES
('Rio Branco', 'AC'),
('Cruzeiro do Sul', 'AC'),
('Sena Madureira', 'AC'),
('Macei??', 'AL'),
('Arapiraca', 'AL'),
('Rio Largo', 'AL'),
('Macap??', 'AP'),
('Santana', 'AP'),
('Laranjal do Jari', 'AP'),
('Manaus', 'AM'),
('Parintins','AM'),
('Itacoatiara', 'AM'),
('Salvador', 'BA'),
('Feira de Santana', 'BA'),
('Vit??ria da Conquista', 'BA'),
('Fortaleza', 'CE'),
('Caucaia', 'CE'),
('Juzeiro do Norte', 'CE'),
('Vit??ria', 'ES'),
('Serra', 'ES'),
('Vila Velha', 'ES'),
('Goi??nia', 'GO'),
('Aparecida de Goi??nia', 'GO'),
('An??polis', 'GO'),
('S??o Luiz', 'MA'),
('Imperatriz', 'MA'),
('S??o Jos?? de Ribamar', 'MA'),
('Cuiab??', 'MT'),
('V??rzea Grande', 'MT'),
('Rondon??polis', 'MT'),
('Campo Grande', 'MS'),
('Dourados', 'MS'),
('Tr??s Lagoas', 'MS'),
('Belo Horizonte', 'MG'),
('Uberl??ndia', 'MG'),
('Contagem', 'MG'),
('Bel??m', 'PA'),
('Abaetetuba', 'PA'),
('Altamira', 'PA'),
('Jo??o Pessoa', 'PB'),
('Campina Grande', 'PB'),
('Santa Rina', 'PB'),
('Curitiba', 'PR'),
('Londrina', 'PR'),
('Maring??', 'PR'),
('Recife', 'PE'),
('Jaboat??o dos Guararapes', 'PE'),
('Olinda', 'PE'),
('Teresina', 'PI'),
('Parna??ba', 'PI'),
('Picos', 'PI'),
('Rio de Janeiro', 'RJ'),
('S??o Gon??alo', 'RJ'),
('Duque de Caxias', 'RJ'),
('Natal', 'RN'),
('Mossor??', 'RN'),
('Parnamirim', 'RN'),
('Porto Alegre', 'RS'),
('Caxias do Sul', 'RS'),
('Canoas', 'RS'),
('Porto Velho', 'RO'),
('Ji-Paran??', 'RO'),
('Ariquemes', 'RO'),
('Boa Vista', 'RR'),
('Rorain??polis', 'RR'),
('Caracara??', 'RR'),
('Florian??polis', 'SC'),
('JoinVille', 'SC'),
('Blumenau', 'SC'),
('S??o Paulo', 'SP'),
('Guarulhos', 'SP'),
('Campinas', 'SP'),
('Aracaju', 'SE'),
('Nossa Senhora do Socorro', 'SE'),
('Lagarto', 'SE'),
('Palmas', 'TO'),
('Aragua??na', 'TO'),
('Gurupi', 'TO'),
('Bras??lia', 'DF'),
('Brazl??ndia', 'DF'),
('Candangol??ndia', 'DF');



INSERT INTO bairro(nm_bairro, sg_estado, cd_cidade) VALUES
('Abra??o Alab', 'AC', '1'),
('Adalberto Arag??o', 'AC', '1'), 
('Aeroporto Velho', 'AC', '1'),
('Alum??nio', 'AC', '2'),
('Tiro ao Alvo', 'AC', '2'),
('Remanso', 'AC', '2'),
('Ana Vieira', 'AC', '3'),
('Bom Sucesso', 'AC', '3'),
('Bosque', 'AC', '3'),
('Antares', 'AL', '4'),
('Barro Duro', 'AL', '4'),
('Bom Parto', 'AL', '4'),
('Alto Cruzeiro', 'AL', '5'),
('Baixao', 'AL', '5'),
('Baixa Grande', 'AL', '5'),
('Alto do S??o Miguel', 'AL', '6'),
('Ant??nio Lins de Souza', 'AL', '6'),
('Brasil Novo', 'AL', '6'),
('Buritizal', 'AP', '7'),
('Cabralzinho', 'AP', '7'),
('Central', 'AP', '7'),
('??gua Fria', 'AP', '8'),
('Chora Menino', 'AP', '8'),
('Imirim', 'AP', '8'),
('Centro', 'AP', '9'),
('Sama??ma', 'AP', '9'),
('Malvinas', 'AP', '9'),
('Adrian??polis', 'AM', '10'),
('Aleixo', 'AM', '10'),
('Alfredo Nascimento', 'AM', '10'),
('Ita??na II', 'AM', '11'),
('Palmares', 'AM', '11'),
('Ita??na I', 'AM', '11'),
('Centro', 'AM', '12'),
('Col??nia', 'AM', '12'),
('Iraci', 'AM', '12'),
('Acupe', 'BA', '13'),
('Aeroporto', 'BA', '13'),
('??guas Claras', 'BA', '13'),
('Sim', 'BA', '14'),
('Tomba', 'BA', '14'),
('Mangabeira', 'BA', '14'),
('Alto Maron', 'BA', '15'),
('Ayrton Senna', 'BA', '15'),
('Bateias', 'BA', '15'),
('Adelota', 'CE', '16'),
('Meireles', 'CE', '16'),
('Coc??', 'CE', '16'),
('A??ude', 'CE', '17'),
('Alto de Garrote', 'CE', '17'),
('Ant??nio Bezerra', 'CE', '17'),
('Piraj??', 'CE', '18'),
('Frei Dami??o', 'CE', '18'),
('Salesianos', 'CE', '18'),
('Jardim Camburi', 'ES', '19'),
('Praia do Canto', 'ES', '19'),
('Barro Vermelho', 'ES', '19'),
('Porto Canoa', 'ES', '20'),
('Bairro de F??tima', 'ES', '20'),
('Laranjeiras', 'ES', '20'),
('Alecrim', 'ES', '21'),
('Alvorada', 'ES', '21'),
('Ara????s', 'ES', '21'),
('Alto da Gl??ria', 'GO', '22'),
('Arei??o', 'GO', '22'),
('Setor Bueno', 'GO', '22'),
('Chacar?? Bela Vista', 'GO', '23'),
('Chacar?? Santa Luiza', 'GO', '23'),
('Chacar?? S??o Pedro', 'GO', '23'),
('Cidade Universit??ria', 'GO', '24'),
('Vila Formosa', 'GO', '24'),
('Vila Jaiara', 'GO', '24'),
('Maracan??', 'MA', '25'),
('Cidade Ol??mpica', 'MA', '25'),
('Conjunto S??o Raimundo', 'MA', '25'),
('??gua Boa', 'MA', '26'),
('Alto Bonito', 'MA', '26'),
('Asa Norte', 'MA', '26'),
('Residencial Nova Aurora', 'MA', '27'),
('Rio S??o Jo??o', 'MA', '27'),
('Vila Sarney Filho', 'MA', '27'),
('Centro-Sul', 'MT', '28'),
('Centro-Norte', 'MT', '28'),
('Dom Aquino', 'MT', '28'),
('7 de Maio', 'MT', '29'),
('24 de Dezembro', 'MT', '29'),
('??gua Limpa', 'MT', '29'),
('Jd. Liberdade', 'MT', '30'),
('Vila Aurora', 'MT', '30'),
('Parque Residencial Universit??rio', 'MT', '30'),
('Cabreuv??', 'MS', '31'),
('Cachoeirinha', 'MS', '31'),
('Carand??', 'MS', '31'),
('Regi??o Parque das Na????es II', 'MS', '32'),
('Regi??o Vila Industrial', 'MS', '32'),
('Regi??o Cana?? III', 'MS', '32'),
('Alto Boa Vista', 'MS', '33'),
('Jardim das Ac??cias', 'MS', '33'),
('Jardim das Am??ricas', 'MS', '33'),
('Aar??o Reis', 'MG', '34'),
('Adalberto Ferraz', 'MG', '34'),
('Aeroporto', 'MG', '34'),
('Presidente Roosevelt', 'MG', '35'),
('Jardim Bras??lia', 'MG', '35'),
('S??o Jos??', 'MG', '35'),
('??gua Branca', 'MG', '36'),
('??rea Industrial de Contagem I', 'MG', '36'),
('Bela Vista', 'MG', '36'),
('Aur??', 'PA', '37'),
('Baia do Sol', 'PA', '37'),
('Barreiro', 'PA', '37'),
('Abaetetuba', 'PA', '38'),
('Algod??o', 'PA', '38'),
('Algodoal', 'PA', '38'),
('Aeroporto', 'PA', '39'),
('Alberto Soares', 'PA', '39'),
('Aparecida', 'PA', '39'),
('Aeroclube', 'PB', '40'),
('??gua Fria', 'PB', '40'),
('Altiplano', 'PB', '40'),
('Bela Vista', 'PB', '41'),
('Bodocong??', 'PB', '41'),
('Centen??rio', 'PB', '41'),
('Barra da Lagoa', 'PB', '42'),
('Cachoeira do Bom Jesus', 'PB', '42'),
('Campeche', 'PB', '42'),
('Centro', 'PR', '43'),
('Centro C??vidco', 'PR', '43'),
('Batel', 'PR', '43'),
('Cinco Conjunto', 'PR', '44'),
('Centro Hist??rico', 'PR', '44'),
('Uni??o da Vit??ria', 'PR', '44'),
('Vila Oper??ria', 'PR', '45'),
('Maring?? Velho', 'PR', '45'),
('Jardim Alvorada', 'PR', '45'),
('Aflitos', 'PE', '46'),
('Afogados', 'PE', '46'),
('??gua Fria', 'PE', '46'),
('Jaboat??o', 'PE', '47'),
('Cavaleiro', 'PE', '47'),
('Curado', 'PE', '47'),
('??guas Compridas', 'PE', '48'),
('Aguazinha', 'PE', '48'),
('Alto da Bondade', 'PE', '48'),
('Jockey', 'PI', '49'),
('F??tima', 'PI', '49'),
('Horto', 'PI', '49'),
('Alto Santa Maria', 'PI', '50'),
('Bairro de F??tima', 'PI', '50'),
('Bebedouro', 'PI', '50'),
('Picos', 'PI', '51'),
('Centro', 'PI', '51'),
('S??o Jos??', 'PI', '51'),
('Bairro Imperial de S??o Crist??v??o', 'RJ', '52'),
('Benfica', 'RJ', '52'),
('Caju', 'RJ', '52'),
('Alc??ntara', 'RJ', '53'),
('Anaia Grande', 'RJ', '53'),
('Arsenal', 'RJ', '53'),
('Campos El??seos', 'RJ', '54'),
('Centro', 'RJ', '54'),
('Ch??caras Rio-Petr??polis', 'RJ', '54'),
('Nova Descoberta', 'RN', '55'),
('Bom Pastor', 'RN', '55'),
('Cidade Nova', 'RN', '55'),
('Bairro Santo Ant??nio', 'RN', '56'),
('Santa Helena', 'RN', '56'),
('Independ??ncia', 'RN', '56'),
('Ema??s', 'RN', '57'),
('Jardim Planalto', 'RN', '57'),
('Liberdade', 'RN', '57'),
('Auxiliadora', 'RS', '58'),
('Azenha', 'RS', '58'),
('Bela Vista', 'RS', '58'),
('S??o Peregrino', 'RS', '59'),
('Madureira', 'RS', '59'),
('Altos do Juvenil', 'RS', '59'),
('Brigadeira', 'RS', '60'),
('Centro', 'RS', '60'),
('Est??ncia Velha', 'RS', '60'),
('Aponi??', 'RO', '61'),
('Pedrinhas', 'RO', '61'),
('Agenor de Carvalho', 'RO', '61'),
('A??ai', 'RO', '62'),
('Aeroporto', 'RO', '62'),
('Alto Alegre', 'RO', '62'),
('Jardim Am??rica', 'RO', '63'),
('Setor Industrial', 'RO', '63'),
('Bairro Marechal Rondon', 'RO', '63'),
('Asa Branca', 'RR', '64'),
('Alvorada', 'RR', '64'),
('Professora Araceli Souto Maior', 'RR', '64'),
('Andara??', 'RR', '65'),
('Campolandia', 'RR', '65'),
('Cidade Nova', 'RR', '65'),
('Centro', 'RR', '66'),
('S??o Franscisco', 'RR', '66'),
('Santa Luzia', 'RR', '66'),
('Barra da Lagoa', 'SC', '67'),
('Cachoeira do Bom Jesus', 'SC', '67'),
('Campeche', 'SC', '67'),
('Adhemar Garcia', 'SC', '68'),
('Am??rica', 'SC', '68'),
('Anita Garibaldi', 'SC', '68'),
('Valpara??so', 'SC', '69'),
('Velha Grande', 'SC', '69'),
('Passo Manso', 'SC', '69'),
('Pinheiros', 'SP', '70'),
('Vila Nova Concei????o', 'SP', '70'),
('Barra Funda', 'SP', '70'),
('Vila Galv??o', 'SP', '71'),
('Maia', 'SP', '71'),
('Macedo', 'SP', '71'),
('Bosque', 'SP', '72'),
('Botafogo', 'SP', '72'),
('Cambu??', 'SP', '72'),
('Centro', 'SE', '73'),
('Get??lio Vargas', 'SE', '73'),
('Cirurgia', 'SE', '73'),
('Parque dos Far??is', 'SE', '74'),
('Taicoca de Dentro', 'SE', '74'),
('Lamar??o', 'SE', '74'),
('Ademar Carvalho', 'SE', '75'),
('Coqueiro de Biaxo', 'SE', '75'),
('Jardim Campo Novo', 'SE', '75'),
('Taquaralto', 'TO', '76'),
('Jardim Aureny I', 'TO', '76'),
('Jardim Taquari', 'TO', '76'),
('Aragua??na Sul', 'TO', '77'),
('S??o Jo??o', 'TO', '77'),
('Centro', 'TO', '77'),
('Casego', 'TO', '78'),
('Jardim Bouvelard', 'TO', '78'),
('Jardim Guanabara', 'TO', '78'),
('Asa Norte', 'DF', '79'),
('Asa Sul', 'DF', '79'),
('Lago Norte', 'DF', '79'),
('Dois Irma??os', 'DF', '80'),
('Engenho Queimado', 'DF', '80'),
('Barreiro', 'DF', '80'),
('Ceilandia', 'DF', '81'),
('Cidade Nova', 'DF', '81'),
('Parano??', 'DF', '81');



INSERT INTO compradores (nm_comprador, nm_enderecoComprador, nr_cpfComprador, tel_comprador, cd_cidade, cd_bairro, sg_estado) VALUES
('Gustavo de Melo', 'Rua Pedro Alvares Cabaral', '111.111.111-11', '1111-1111', 70, 210, 'SP'),
('Jonathan Pereira', 'Rua Domingues', '222.222.222-22', '2222-2222', 81, 243, 'DF'),
('Carlos Eduardo', 'Rua Presidente', '333.333.333-33', '3333-3333', 23, 67, 'GO'),
('Lucas Albuquerque', 'Rua Cabloco', '444.444.444-44', '4444-4444', 28, 84, 'MT'),
('Nicole Barros', 'Rua Pompeia', '555.555.555-55', '5555-5555', 31, 92, 'MS'),
('Alexandre Silva', 'Rua Sol', '666.666.666-66', '6666-6666', 37, 110, 'PA'),
('Aline Constantino', 'Rua Tars??lia do Amaral', '7777.777.777-77', '7777-7777', 42, 126, 'PR'),
('Bruno Henrique', 'Rua Luar', '888.888.888-88', '8888-8888', 49, 145, 'PI'),
('Kayc Santana', 'Rua Imperial', '999.999.999-99', '9999-9999', 52, 154, 'RJ'),
('Rodrigo Caetano', 'Rua Elenice', '101.101.101-10', '1010-1010', 56, 167, 'RN');


INSERT INTO vendedor(nm_vendedor, nm_endereco, nr_cpfVendedor, tel_vendedor, data_nascVendedor, cd_cidade, cd_bairro, sg_estado) VALUES
('Gabriel Mendes', 'Rua Camundongo', '000.000.000-00', '0000-0000', '1984-07-02', 1, 1, 'AC'),
('Kamila Alves', 'Rua Broto', '010.010.010.01', '0101-0101', '2000-12-24', 80, 241, 'DF'),
('Clodoaldo', 'Rua Vasconcelos', '020.020.020-02', '0202-0202', '1996-05-08', 73, 218, 'SE'),
('Nathan Monaco', 'Rua Tribalista', '030.030.030-03', '0303-0303', '2002-03-06', 63, 187, 'RO'),
('Yago Machado', 'Rua Joy', '040.040.040-04', '0404-0404', '1959-06-21', 7, 20, 'AL'),
('Igor Menezes', 'Rua Paulista', '050.050.050-05', '0505-0505', '1972-01-30', 14, 41, 'BA'),
('Joelma Barros', 'Rua Paulo Pereira', '060.060.060-06', '0606-0606', '2001-01-01', 15, 44, 'BA'),
('Renan Gabriel', 'Rua Esmeralda', '070.070.070-07', '0707-0707', '2002-05-26', 39, 116, 'PA'),
('Rodrigo Caldeira', 'Rua P??r do Sol', '080.080.080-08', '0707-0707', '1974-09-07', 59, 177, 'RS'),
('Tales Almeida', 'Rua Oligarquia', '090.090.090-09', '0707-0707', '1992-12-20', 56, 167, 'RN');




INSERT INTO 
faixa_imovel(nm_faixa, vl_minimo, vl_maximo) VALUES
('Baixo', 0.00, 10500.00),
('M??dio', 105001.00, 180000.00),
('Alto', 180001.00, 999999.00);


INSERT INTO
imovel(nm_endereco,nr_areautil,Nr_areatotal,vl_preco,st_vendido,data_lancto,cd_comprador,cd_vendedor,cd_bairro,cd_cidade,sg_estado, cd_oferta) VALUES
('Anita Garibaldi', 100000.00, 200000.00, 40000000.00, '?? venda', '2007-02-21', 3, 3, 204, 68, 'SC', 1),
('Pinheiros', 700000.00, 200.00, 400.00, '?? venda', '2019-05-12', 1, 4, 208, 70, 'SP', 2);

INSERT INTO 
oferta(vl_oferta,dt_oferta,cd_imovel,cd_comprador) VALUES
(500000.00,'2008-05-04', 1, 1),
(2000.00, '2019-06-01', 2, 1);