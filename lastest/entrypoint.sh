#!/bin/bash

echo "starting app";
python3 $ODOO_BIN -c $ODOO_CONFIG -r $POSTGRES_USER -w $PASSWORD --database $POSTGRES_DB --db_host $DB_HOST --db_port $DB_PORT --http-port $HTTP_PORT