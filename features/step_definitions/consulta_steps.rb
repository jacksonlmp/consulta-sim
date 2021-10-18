Given ('eu estou cadastrado no sistema com o nome {string} e a data de nascimento {Date} e o cpf {string} e o email {string}') do 
    visit "/consultas/new"
    fill_in 'paciente[nome]', :with "Jackson Lima"
    fill_in 'paciente[dataNascimento]', :with "1999-11-02"
    fill_in 'paciente[cpf]', :with "13095175346"
    fill_in 'paciente[email]', :with "jacksonlm@lima.br"
    fill_in 'cep',	with: "56460000"
    fill_in 'cidade', with: "Petrolandia"
    fill_in 'bairro', with: "Quadra 15"
    fill_in 'logradouro', with: "Rua nossa senhora da saude"
    fill_in 'complemento', with: "casa"
    click_button 'Create paciente'
end

Given ('')