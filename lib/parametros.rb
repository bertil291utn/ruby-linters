class Parametros
  attr_reader :tamano_codigo, :tamano_linea

  def initialize(archivo)
    @doc = archivo
    @identacion = 2
    @tamano_codigo = 140
    @tamano_linea = 100
  end
end
