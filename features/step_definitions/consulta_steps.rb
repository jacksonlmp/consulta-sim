Given ('eu estou cadastrado no sistema com o nome {string} e a data de nascimento {Date} e o cpf {string} e o email {string}') do 
    visit "/consultas/new"
    fill_in 'paciente[nome]', with: "Jackson Lima"
    fill_in 'paciente[dataNascimento]', with: "1999-11-02"
    fill_in 'paciente[cpf]', with: "13095175346"
    fill_in 'paciente[email]', with: "jacksonlm@lima.br"
    fill_in 'cep',	with: "56460000"
    fill_in 'cidade', with: "Petrolandia"
    fill_in 'bairro', with: "Quadra 15"
    fill_in 'logradouro', with: "Rua nossa senhora da saude"
    fill_in 'complemento', with: "casa"
    click_button 'Criar consulta'
end

Given ('eu estou na pagina de cadastro de consulta')
    click_link 'Criar consulta'
    visit '/consulta/new'
endcu

Given('eu estou na pagina de edicao de consulta')
    click_link "Editar"
end

when('eu edito uma consulta com a data {Date} o horario {Date} o medico {string} o paciente {string}')
    fill_in 'consulta[data]', :with => data.to_date
    fill_in 'consulta[horario]', :with => horario.to_time
    fill_in 'consulta[medico]', with: "Paulo Muzy"
    fill_in 'consulta[paciente]', with: "Jackson Lima"
end

When('eu clico em salvar uma consulta')
    click_button "Update Consultum"
end

Given ('eu estou cadastrado no sistema com o nome {string} e a data de nascimento {Date} e o cpf {string} e o email {string}') do 
    visit "/consultas/new"
    fill_in 'paciente[nome]', :with "Jackson Lima"
    fill_in 'paciente[dataNascimento]', :with "1999-11-02"
    fill_in 'paciente[cpf]', with: "13095175346"
    fill_in 'paciente[email]', with: "jacksonlm@lima.br"
    fill_in 'cep',	with: "56460000"
    fill_in 'cidade', with: "Petrolandia"
    fill_in 'bairro', with: "Quadra 15"
    fill_in 'logradouro', with: "Rua nossa senhora da saude"
    fill_in 'complemento', with: "casa"
    click_button 'Criar consulta'
end

And ("estou na pagina de cadastro de consultas") do
    click_link "Marcar Consulta"
    visit '/consulta/new'

When('eu preencho os campos  data {Date} e horario {Time} e medico {String} e Paciente {String}') do |Date, Time, String|
    fill_in 'consultum[data]', with: => "2019-05-08"
    fill_in 'consultum[horario]', :with => horario.to_date
    fill_in 'consultum[medico]', with: "Paulo Muzy"
    fill_in 'consultum[paciente]', with: "Jackson Lima"
end 

When('eu clico em criar uma consulta') do
    click_button 'Create Consultum'
end

Then('eu vejo uma mensagem de erro')
    expect(page).to have_content('Data Invalid Date')
end 
