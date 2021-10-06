class Consultum < ApplicationRecord
  require 'Time'
  belongs_to :medico
  belongs_to :paciente

  validate :validarHorario
  validate :validarDataConsulta

  def validarDataConsulta
    if data.present? && data < Date.today
      errors.add(:data, "Invalid Date")
    end
  end

  def validarHorario
    if data.present? && Date.today && horario < Time.current
      errors.add(:horario, "Invalid Hour")
    end
  end
end
