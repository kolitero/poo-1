``` mermaid
classDiagram
   Itens <-- Produto
   Venda <-- Itens
   class Produto{
      +String description
      +String validate
      +double price
   }
   class Itens{
      +double quantidade
      +Produto produto
      +double total()
   }
   class Venda{
      +String data
      +List itens
      +double total()
   }
```
