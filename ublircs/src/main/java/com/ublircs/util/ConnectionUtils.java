package com.ublircs.util;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by Usman Siddiq on 3/5/2019.
 */
public class ConnectionUtils {

    public static Connection getConnection() throws SQLException,
            ClassNotFoundException {

        // Using MSSQL
        //return SQLServerConnUtils.getSQLServerConnection_SQLJDBC();
        // Using MySQL
        return MySQLConnUtils.getMySQLConnection();

    }

    //
    // Test Connection ...
    //
    public static void main(String[] args) throws SQLException,
            ClassNotFoundException {

        System.out.println("Get connection ... ");

        // Get a Connection object
        Connection conn = ConnectionUtils.getConnection();

        System.out.println("Get connection " + conn);

        System.out.println("Done!");
    }

}
