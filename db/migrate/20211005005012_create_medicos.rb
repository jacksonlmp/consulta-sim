class CreateMedicos < ActiveRecord::Migration[6.1]
  def change
    create_table :medicos do |t|
      t.string :nomeCompleto
      t.date :dataNascimento
      t.string :cpf
      t.string :email
      t.string :especialidade
      t.string :crm

      t.timestamps
    end
  end
end
