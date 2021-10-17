require "test_helper"

class ConsultumTest < ActiveSupport::TestCase
  test "criando consulta" do
    consulta = Consultum.new(data: '2021-10-16', horario: '21:31', medico_id: medico.id, paciente_id: paciente.id)
    assert consulta.save 
  end

  test "criando consulta sem paciente " do
    consulta = Consultum.new(data: '2021-10-16', horario: '21:31', medico_id: medico.id, paciente_id: '')
    assert_not consulta.save
  end
  
  test "editando consulta" do
    consulta = Consultum.new(data: '2021-10-16', horario: '21:31', medico_id: medico.id, paciente_id: paciente.id)
    assert consulta.save 
    assert consulta.update(data: '2021-11-20', horario: '11:15', medico_id: medico.id, paciente_id: paciente.id)
  end

  test "editando consulta com data passada" do
    consulta = Consultum.new(data: '2021-10-15', horario: '21:31', medico_id: medico.id, paciente_id: paciente.id)
    assert consulta.save 
    assert_not consulta.update(data: '2020-05-30', horario: '21:31', medico_id: medico.id, paciente_id: paciente.id)
  end

end
