package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DB_MySQL 
{

	private static final String user = "root";
	private static final String password = "";
	private static final String ip = "localhost";
	private static final String context = "annuaire";
	private static final int port = 3306;
	private static final String driver_mysql = "com.mysql.jdbc.Driver";
	private static Connection connection;
	
	public static boolean demarrer() throws Exception
	{
        try 
        {
            Class.forName(driver_mysql);
        } catch (ClassNotFoundException e) 
        {
            throw new Exception("Erreur lors du chargement du driver JDBC \n"  + e.toString());
        }
        
        connection = null;
        
        try 
        {
            connection = DriverManager.getConnection("jdbc:mysql://"+ ip +":"+ port +"/"+ context , user , password);
        } catch (SQLException e) 
        {
        	throw new Exception("Erreur lors de la connexion à la base de données : " + e.toString());
        }
        if (connection != null) 
		    return true;
        else 
        	return false;
	}
	
    public static void stop() throws Exception
    {
		try 
		{
			connection.close();
		} catch (SQLException e) 
		{
			throw new Exception("Erreur lors de la fermeture de la base de données : " + e.toString());
		}
    }
    
    public static Connection getConnection() throws Exception
    {
        if (connection != null) 
        	return connection;
        else 
        	throw new Exception("La connexion n'est pas encore établie.");
    }
    
    public static Statement createStatement() throws Exception
    {
    	try 
    	{
			return connection.createStatement();
		} catch (SQLException e) 
    	{
			throw new Exception("Impossible de créer une nouvelle requête : " + e.toString());
		}
    }
}
