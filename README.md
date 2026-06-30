# iOS Welcome App - Projeto de Estudo

Aplicativo desenvolvido em **UIKit** com foco no estudo de navegação entre telas, comunicação entre ViewControllers, validação de formulários e construção de interfaces programaticamente.

Ao longo da evolução do projeto, novas funcionalidades foram adicionadas, incluindo seleção de avatar, tela de boas-vindas personalizada, feed do usuário e melhorias na experiência de uso.

## O que o app faz

- Permite criar um perfil informando o nome do usuário
- Permite escolher um avatar durante o cadastro ou posteriormente
- Exibe uma tela de boas-vindas personalizada
- Exibe um feed contendo avatar, nome e mensagem de boas-vindas
- Permite realizar logout, retornando à tela inicial
- Valida o formulário antes de permitir a criação da conta
- Exibe alertas quando informações obrigatórias não são preenchidas
- Ajusta o layout para diferentes orientações de tela

## Arquitetura

O projeto foi estruturado utilizando **UIKit programático**, explorando navegação entre telas, comunicação através de Delegates e componentes personalizados para construção da interface.

## Decisões importantes

- UIKit programático (sem Storyboard)
- Navegação utilizando UINavigationController
- Comunicação entre telas utilizando Delegate Pattern
- Modal customizado utilizando UIPresentationController
- Validação de formulário antes da criação da conta
- Inicialização do fluxo utilizando SceneDelegate
- Organização da interface utilizando Auto Layout


https://github.com/user-attachments/assets/18f9e122-f35d-4e21-a92a-dd6135634eff


## Melhorias implementadas

Durante a evolução do projeto foram adicionadas novas funcionalidades:

- Inclusão de tela de boas-vindas com texto estilizado
- Exibição de GIF animado utilizando SDWebImage
- Tela de cadastro aprimorada com seleção de avatar
- Implementação de modal customizado para escolha do avatar
- Comunicação entre telas utilizando Delegates
- Feed personalizado exibindo avatar e nome do usuário
- Botão de logout retornando para a tela inicial
- Validação dinâmica do formulário, habilitando o botão **Criar Conta** apenas quando os dados são válidos
- Suporte a diferentes orientações de tela

## Conceitos praticados

- Swift
- UIKit
- UINavigationController
- UILabel
- UITextField
- UIButton
- UIAlertController
- Auto Layout
- NSLayoutConstraint
- Delegate Pattern
- UIPresentationController
- SceneDelegate
- SDWebImage
- NSMutableAttributedString

https://github.com/user-attachments/assets/40dc1ae6-18a9-45d9-9791-454a121844ee
