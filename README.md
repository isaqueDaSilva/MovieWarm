# MovieWarm
A maneira mais simples de adicionar seus pensamentos dos filmes que você assistiu.
 
# Descrição
Este é um App voltado para os amantes de filmes, que desejam registrar seus pensamentos após assistirem algum filme.

# Getting started
- Verifique se você está executando o Xcode 15.4 ou posterior;
- Faça o download do arquivo do projeto a partir do repositório;
- Abra o site da ![OMDb API](http://www.omdbapi.com) e crie uma nova API Key;
- Abra o projeto no Xcode;
- Adicione sua chave de API Key ao arquivo "Config.xcconfig" da seguinte maneira: <br> 
```
API_KEY = {Sua API Key}
```
- Por fim, execute-o.

# Recursos
- Criação de um novo review de filme;
- Atualização de um review existente;
- Deletação de um review existente;
- Busca informações sobre o filme desejado a partir da OMDb API. <br>
```
Obs: Digite o titulo do filme desejado em Inglês.

Ex: 
Titulo em português: Homem de ferro
Termo aceito(Em Inglês): Iron Man
```
- Salva e persiste o review no dispositivo utilizando o Core Data;

# Estrutura
- "Splash Screen": Contém um arquivo SwiftUI com uma animação, no qual é exibida momento quando o App é aberto;
- "Storage": Contém todos os modelos bases para o uso do App e a configuração padrão do Core Data;
- "DTOs": Contém todos os modelos que são utilizados para decodificar uma resposta vinda da API, após a busca ser finalizada;
- "Extensions": Contém extensões customizadas para os tipos padrões do Swift;
- "Error": Contém todos os erros customizados que são utilizados no App.
- "View": Contém subpastas no qual estão armazenadas todas as SwiftUI views.<br>
```
Obs1: Com excessão da pasta de UI Components, todas as outras subpastas contém um arquivo para o ViewModel;
Obs2: Algumas das subpastas apresentam outras subpastas que podem ser o `Components` para os componentes expecificos de visualização para aquela determinada view e/ou uma subpasta nomeada `Service` que contém arquivos Swifts para realização de uma determinada tarefa.
```


