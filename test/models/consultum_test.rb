require "test_helper"

class ConsultumTest < ActiveSupport::TestCase
  test "criando consulta" do  
    paciente = Paciente.new(nomeCompleto: 'Jackson Lima', dataNascimento: '1999-11-02', cpf: '75385215946', email: 'jack@lima.br')
    endereco = Endereco.new(cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id)
    paciente.endereco = endereco
    paciente.save

    medico = Medico.new(nomeCompleto: 'Paulo Muzy', dataNascimento: '1969-05-08', cpf: '85295175346', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
    medico.save
    consulta = Consultum.new(data: '2021-10-20', horario: '21:31', medico_id: medico.id, paciente_id: paciente.id)
    
    assert consulta.save 
  end

  test "criando consulta sem paciente " do
    paciente = Paciente.new(nomeCompleto: 'Jackson Lima', dataNascimento: '1999-11-02', cpf: '75385215946', email: 'jack@lima.br') 
    endereco = Endereco.new(cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id)
    paciente.endereco = endereco
    paciente.save

    medico = Medico.new(nomeCompleto: 'Paulo Muzy', dataNascimento: '1969-05-08', cpf: '85295175346', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
    medico.save

    consulta = Consultum.new(data: '2021-10-20', horario: '21:31', medico_id: medico.id, paciente_id: '')
    
    assert_not consulta.save
  end
  
  test "editando consulta" do 
    paciente = Paciente.new(nomeCompleto: 'Jackson Lima', dataNascimento: '1999-11-02', cpf: '75385215946', email: 'jack@lima.br') 
    endereco = Endereco.new(cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id)
    paciente.endereco = endereco
    paciente.save

    medico = Medico.new(nomeCompleto: 'Paulo Muzy', dataNascimento: '1969-05-08', cpf: '85295175346', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
    medico.save

    consulta = Consultum.new(data: '2021-10-25', horario: '22:30', medico_id: medico.id, paciente_id: paciente.id)
    assert consulta.update(data: '2021-11-20', horario: '11:15', medico_id: medico.id, paciente_id: paciente.id)
  end

  test "editando consulta com data passada" do   
    paciente = Paciente.new(nomeCompleto: 'Jackson Lima', dataNascimento: '1999-11-02', cpf: '75385215946', email: 'jack@lima.br') 
    endereco = Endereco.new(cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id)
    paciente.endereco = endereco
    paciente.save

    medico = Medico.new(nomeCompleto: 'Paulo Muzy', dataNascimento: '1969-05-08', cpf: '85295175346', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
    medico.save

    consulta = Consultum.new(data: '2021-10-20', horario: '21:31', medico_id: medico.id, paciente_id: paciente.id)
    
    assert_not consulta.update(data: '2020-05-15', horario: '21:31', medico_id: medico.id, paciente_id: paciente.id)
  end

end
