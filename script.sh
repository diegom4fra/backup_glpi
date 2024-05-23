#!/usr/bin/bash
#-------------------------------------------------------
# Script de Backup - GLPI
# @author: diegom4fra@gmail.com
#-------------------------------------------------------

#Parâmetros
DEST_DIR=/backup
TIMESTAMP=$(date +%Y%m%d%H%M%S)
DB_NAME="glpidatabase"
MANTER_VERSOES=7

#Registra log de Start do Backup
logger "Backup Iniciado..."

#Realiza Dump da Base de dados
mysqldump --databases $DB_NAME > /var/www/glpi/glpi.sql

#Movimenta os arquivos do sistema e SQL.
tar -czvf ${DEST_DIR}/GLPI_${TIMESTAMP}.tar.gz \
        /var/www/glpi \
        /var/lib/glpi \
        /etc/glpi     \
        /etc/apache2/sites-available

#Remove arquivo de dump
rm -rf /var/www/glpi/glpi.sql

#Removendo backups antigos
skip=0
ls -c $DEST_DIR | while read line; do
        skip=$(($skip + 1));
        if [ $skip -gt $MANTER_VERSÕES]; then
                logger "removendo backups antigos do GLPI $line"
                rm -rf $DEST_DIR/$line
        fi
done

logger "Backup finalizado..."
