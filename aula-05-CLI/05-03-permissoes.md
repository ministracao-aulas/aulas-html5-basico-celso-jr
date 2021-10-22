https://www.linuxsecrets.com/480-linux-unix-permissions-and-attributes

TYPES
d - directory
t - temporary
l - symlink
- - file

TYPE
OWNER
    R 4 - Read
    W 2 - Write
    X 1 - eXecution
GROUP
    R 4 - Read
    W 2 - Write
    X 1 - eXecution
OTHERS
    R 4 - Read
    W 2 - Write
    X 1 - eXecution

```sh
# - --- --- ---
# - RWX RWX --- celso gordos abr 2021 lista-do-churrasco.txt
```

Para alterar as permissões podemos usar:

```shell
#Permisssão total para todos
chmod ugo+wrx
# ou
chmod 777

#Remoção da permisssão de execução para todos
chmod ugo-x

#Adição da permisssão de execução para o usuário/owner
chmod u+x
```
