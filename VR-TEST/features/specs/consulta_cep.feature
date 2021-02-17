#language: pt

Funcionalidade: Consultar CEP
    Sendo um usuário que acesso o Via CEP
    Quero fazer uma consulta de um determinado endereço
    Para que eu possa validar as informações

    #@consulta_com_sucesso
    Cenario: Consulta cep com sucesso 
        Dado que eu informe um determinado cep
            | cep          | ibge    | 
            |04201030     | 3550308 |   
        Quando envio as informações
        Então o endereço é retornado com o campo IBGE "3550308"

   #@consulta_sem_sucesso
    Cenario: Consulta cep sem sucesso
        Dado que eu informe um determinado cep
            | cep         | 
            |11122333     |
        Quando envio as informações
        Então endereço não é retornado



