require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test "criando medico" do
    medico = Medico.new(nomeCompleto: 'Paulo ', dataNascimento: '1969-05-08', cpf: '85295175346', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
    assert medico.save 
  end

  test "criando medico sem nome " do
    medico = Medico.new(nomeCompleto: '', dataNascimento: '1969-05-08', cpf: '85295175346', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
    assert_not medico.save
  end
  
  test "editando medico" do
    medico = Medico.new(nomeCompleto: 'Paulo', dataNascimento: '1969-05-08', cpf: '85295175346', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
    assert medico.save 
    assert medico.update(nomeCompleto: 'Paulo Muzy', dataNascimento: '1969-05-08', cpf: '85295175346', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
  end

  test "editando medico sem cpf" do
    medico = Medico.new(nomeCompleto: 'Paulo Muzy', dataNascimento: '1969-05-08', cpf: '', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
    assert medico.save 
    assert_not medico.update(nomeCompleto: 'Paulo Muzy ', dataNascimento: '1969-05-08', cpf: '85295175346', email: 'muzy@paulo.br', especialidade: 'Endocrinologista', crm: '46584')
  end
  
end
