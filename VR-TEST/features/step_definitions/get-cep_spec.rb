require "httparty"
Dado('que eu informe um determinado cep') do |table|
    @cep = table.hashes.first["cep"] 
end
  
Quando('envio as informações') do
    @result = HTTParty.get(
        "https://viacep.com.br/ws/#{@cep}/json/", 
        headers: { 
            "Content-Type" => "application/json",
        },
        )
end

Então('o endereço é retornado com o campo IBGE {string}') do |ibge|
    expect(@result.code).to eql 200 
    expect(@result["erro"]).to be_nil
    expect(@result["ibge"]).to eql ibge
  
    log "O código IBGE do endereço é: " + ibge
end

Então('endereço não é retornado') do 
    expect(@result.code).to eql 200
    expect(@result["erro"]).not_to be_nil
    
    log "Endereço inválido! "
end



