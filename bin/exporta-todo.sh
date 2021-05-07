#!/bin/sh
# Saca copia de todos los datos.
# vtamara@pasosdeJesus.org. Dominio p�blico. 2020

# Genera un script SQL que se ejecuta desde una base vacia para reconstruir
# pero con due�o diferente

. .env

dm=`date +%d`
echo "Por generar datos de casos para enviar a  $usuarioact@$maquinaweb:$dirweb con opciones '$opscpweb'";
echo "El usuario puede cambiarse en .env";
echo "[ENTER] para continuar o [Ctrl]-[C] para detener";
read a
echo "1 de 3. Copia ..."
ord="pg_dump $base --no-owner --clean -h /var/www/var/run/postgresql -U $ubase --no-owner"
echo "$ord > $rlocal/sivel2-todo-$dm.sql"
eval $ord > $rlocal/sivel2-todo-$dm.sql #Todo por procesar mas

echo "Restaurar en otra base en el mismo servidor y limpiar"

