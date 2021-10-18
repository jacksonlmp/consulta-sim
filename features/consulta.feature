Feature: consulta
    As a paciente
    I want to criar, remover, editar e atualizar uma consulta no sistema
    So that eu nao quero fazer isso manualmente

Scenario: cadastrar uma consulta
    Given eu estou cadastrado no sistema com o nome ”Jackson Lima” e a data de nascimento “1999-11-02” e o cpf “15985265423” e o email “jack@jack.br”
    When eu crio uma consulta com o medico “Paulo Muzy” e a data “2021-10-29” e o horario “20:02”
    And eu clico em criar uma consulta
    Then eu vejo uma mensagem de confirmacao de consulta criada

Scenario: editar uma consulta
    Given eu estou cadastrado no sistema com o nome ”Jackson Lima” e a data de nascimento “1999-11-02” e o cpf “15985265423” e o email “jack@jack.br”
    And estou na pagina de cadastro de consulta
    When eu crio uma consulta com o medico “Paulo Muzy” e a data “2021-10-29” e o horario “20:02”
    And eu clico em criar uma consulta
    And eu estou na pagina de edicao de consulta
    And eu edito uma consulta com o medico “Paulo Muzy” e a data “2021-10-29” e o horario “20:02”
    And eu clico em editar uma consulta
    Then eu vejo uma mensagem de confirmacao de edicao

Scenario: cadastrar uma consulta com data passada
    Given eu estou cadastrado no sistema com o nome ”Jackson Lima” e a data de nascimento “1999-11-02” e o cpf “15985265423” e o email “jack@jack.br”
    When eu crio uma consulta com o medico “Paulo Muzy” e a data “2019-05-11” e o horario “20:02”
    And eu clico em criar uma consulta
    Then eu vejo uma mensagem de erro

Scenario: cadastrar uma consulta sem medico
    Given eu estou cadastrado no sistema com o nome ”Jackson Lima” e a data de nascimento “1999-11-02” e o cpf “15985265423” e o email “jack@jack.br”
    When eu crio uma consulta com o medico “” e a data “2021-10-29” e o horario “20:02”
    And eu clico em criar uma consulta
    Then eu vejo uma mensagem de erro