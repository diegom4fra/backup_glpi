O script realiza backup dos seguintes diretórios:

/var/www/glpi
/var/lib/glpi
/etc/glpi
/etc/apache2/sites-available

O resultado do script é um arquivo compactado com as pastas acima e, um Dump do banco do GLPI.
Para funcionamento, basta apontar corretamente o diterório de destino.

Após editar o script, agende sua execução diária via crontab.

Para restaurar, basta instalar uma nova instância e substituir os arquivos e pastas.
Depois de substituir os arquivos, altere a permissão da pasta completa /var/www/ para o usuario "www-data".

Para ajustar as permissões gerais:
find /var/www/glpi/ -type -d -exec chmod 755 {} \;
find /var/www/glpi/ -type -f -exec chmod 644 {} \;
