# 📱 Envia & Recebe

Este projeto foi desenvolvido com fins **educacionais**, como parte dos meus estudos iniciais de desenvolvimento iOS com Swift. O objetivo principal foi entender como criar um app básico com **duas telas**, **navegação entre elas**, **envio de dados de uma tela para outra**, e **interações simples com o usuário** usando UIKit.

## A proposta do app:
1. Exibir uma **primeira tela** que solicite do usuário o envio de algum dado, neste caso, o seu nome;
2. Ao preencher e clicar em "Enviar", navegar para a **segunda tela**;
3. A segunda tela exibe uma **mensagem personalizada de boas-vindas**, usando o nome que foi inserido.

Além disso, foi adicionado um **alerta (pop-up)** para garantir que o campo de nome não seja enviado em branco.

## Tecnologias e Ferramentas Utilizadas:

- **Linguagem:** Swift
- **Interface:** UIKit (sem uso de Storyboard)
- **Navegação entre telas:** `UINavigationController`
- **Componentes visuais:** `UILabel`, `UITextField`, `UIButton`, `UIAlertController`
- **Layout com Auto Layout (`NSLayoutConstraint`)**
- **Customização de cores usando RGB**

## O que foi estudado e aplicado:

- **Criação de telas com UIKit programaticamente**
- **Organização de layout com Auto Layout**
- **Transição entre view controllers com `UINavigationController`**
- **Passagem de dados entre telas (envio do nome digitado)**
- **Exibição de pop-up de alerta (`UIAlertController`)**
- **Estilização de texto com `NSMutableAttributedString`**
- **Configuração de botão de voltar com ícone e cor customizada**

## Estrutura do Projeto:

### `FirstViewController.swift` que contém:
- Um texto com instrução;
- Um campo de texto para receber do usuário o dado (nome);
- Um botão de "Enviar";
- Um alerta caso o botão seja pressionado sem que um dado (nome) seja inserido.
Ao digitar um nome e pressionar "Enviar", o app navega para a segunda tela passando esse nome como dado.

### `SecondViewController.swift`:
A segunda tela recebe o dado (nome) digitado na primeira tela e mostra uma mensagem personalizada de boas-vindas, estilizada com cor.
Também possui:
- Um botão de "voltar" com ícone `chevron.left` que também teve sua cor personalizada. 


### Dificuldades encontradas: 
Destacar o dado recebido na segunda tela (em estudo). 

https://github.com/user-attachments/assets/18f9e122-f35d-4e21-a92a-dd6135634eff


