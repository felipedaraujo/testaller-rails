class Message
  def self.not_found(record = 'record')
    "Desculpa, #{record} nao encontrado"
  end

  def self.invalid_credentials
    'Email ou senha inválidos'
  end

  def self.invalid_token
    'Token inválido'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Requisição não autorizada'
  end

  def self.account_created
    'Conta criada com sucesso'
  end

  def self.account_not_created
    'Conta não pôde ser criada'
  end

  def self.expired_token
    'Seu token expirou, por favor, entre na sua conta novamente'
  end
end
