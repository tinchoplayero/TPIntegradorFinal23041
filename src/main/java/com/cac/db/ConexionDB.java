package com.cac.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.eclipse.jdt.internal.compiler.batch.Main;

public class ConexionDB {
	private static final String CONTROLADOR = "com.mysql.cj.jdbc.Driver";
	private static final String BD = "oradores";
	private static final String URL = "jdbc:mysql://localhost:3306/";
	private static final String USUARIO = "root";
	private static final String PASS = "";
	Connection conexion = null;
	
	public ConexionDB() {
		
	}
	
	
	
	public Connection conectar() {
		try {
			Class.forName(CONTROLADOR);
			System.out.println("se conectó el controlador");
		} catch (ClassNotFoundException e) {
			System.out.println("Error de Controlador");
			e.printStackTrace();
		}
		try {
			conexion = DriverManager.getConnection(URL+BD,USUARIO,PASS);
			System.out.println("Se conectó a "+BD);
		} catch (SQLException e) {
			System.out.println("Error de Conexion");
			e.printStackTrace();
		}
		return conexion;	
		}
	
	
	
	public void desconectar() {
		try {
			conexion.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		ConexionDB con=new ConexionDB();
		con.conectar();
		
	}

	
	 
}