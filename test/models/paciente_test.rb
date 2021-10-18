require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "criando paciente" do
    paciente = Paciente.new(nomeCompleto: 'Jackson Lima', dataNascimento: '1999-11-02', cpf: '75385215946', email: 'jack@lima.br')
    endereco = Endereco.new(cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id)
    paciente.endereco = endereco
    paciente.save
  end

  test "criando paciente sem nome " do
    paciente = Paciente.new(nomeCompleto: '', dataNascimento: '1999-11-02', cpf: '75385215946', email: 'jack@lima.br')
    endereco = Endereco.new(cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id)
    paciente.endereco = endereco
    paciente.save
  end
  
  test "editando paciente" do
    paciente = Paciente.new(nomeCompleto: 'Jackson Lima', dataNascimento: '1999-11-02', cpf: '75385215946', email: 'jack@lima.br')
    endereco = Endereco.new(cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id)
    paciente.endereco = endereco
    paciente.save
    assert paciente.update(nomeCompleto: 'Jackson Lima', dataNascimento: '1999-11-02', cpf: '85295175346', email: 'jack@lima.br', :endereco_attributes=>{cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id})
  end

  test "editando paciente sem cpf" do
    paciente = Paciente.new(nomeCompleto: 'Jackson Lima', dataNascimento: '1999-11-02', cpf: '75385215946', email: 'jack@lima.br')
    endereco = Endereco.new(cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id)
    paciente.endereco = endereco
    paciente.save
    assert_not paciente.update(nomeCompleto: 'Jackson Lima', dataNascimento: '1999-11-02', cpf: '', email: 'jack@lima.br', :endereco_attributes=>{cep: '56460000', cidade: 'Petrolandia', bairro: 'Quadra 15', logradouro: 'Rua nossa senhora da saude', complemento: 'casa', paciente_id: paciente.id})
  end
end
