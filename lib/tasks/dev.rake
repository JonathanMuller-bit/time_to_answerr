namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do 
    if Rails.env.development?
      show_spinner("Dropping DB...") { %x(rails db:drop) }
      show_spinner("Creating DB...") { %x(rails db:create) }
      show_spinner("Migrating DB...") { %x(rails db:migrate) }
      show_spinner("Creating default admin...") { %x(rails dev:add_default_admin) }
      show_spinner("Creating default student...") { %x(rails dev:add_default_student) }
    else
      puts 'Você não está no ambiente de desenvolvimento!'
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do 
    Admin.create!(
      email: 'admin@admin.com',
      password: 'admin123',
      password_confirmation: 'admin123'
    )
  end

  desc "Adiciona um aluno padrão"
  task add_default_student: :environment do 
    Student.create!(
      email: 'student@student.com',
      password: 'student123',
      password_confirmation: 'student123'
    )
  end

  private

  def show_spinner(msg_start, msg_end = 'Complete!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end
end

