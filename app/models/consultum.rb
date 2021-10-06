class Consultum < ApplicationRecord
  belongs_to :medico
  belongs_to :paciente

  validate :validarDataConsulta

  def validarDataConsulta
    if data.present? && data < Date.today
      errors.add(:data, "Invalid Date")
    end
  end
end
