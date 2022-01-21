/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package crud_restaurante;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.swing.JOptionPane;
/**
 *
 * @author ALDAIR
 */
public class Transaccion2 {
    Connection restauranteBD = null;
    Statement consultasBD = null;
    ResultSet resultado = null;
    PreparedStatement sentencia = null; 
    CallableStatement llamada;
    
    String sql;
    
    Boolean aviso = true;
    
    //String id_cliente, id_reservacion, id_mesa, estado, fecha_llamada, fecha_reservacion;
    //int id_aux, id_aux2, id_aux3;
    
    
    
    //Método para conectar la base de datos :)
    public void conexionBD (){
        try{
            restauranteBD = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Restaurante V2","postgres","postgres");
        }catch(SQLException e){
            System.out.println("Error al conectar: " + e.getMessage());
        }       
    }
    
    public void prueba2(String id_cliente, String id_reservacion, String id_mesa, String estado, String fecha_llamada, String fecha_reservacion){
        conexionBD();
        /*id_cliente = Transaccion_2.id_cliente.getText();
        id_reservacion = Transaccion_2.id_reservacion.getText();
        id_mesa = Transaccion_2.id_mesa.getText();
        
        id_aux = Integer.parseInt(id_cliente);
        id_aux2 = Integer.parseInt(id_reservacion);
        id_aux3 = Integer.parseInt(id_mesa);*/
        try{
  
            llamada = restauranteBD.prepareCall("call transaccion_estadomesa(?,?,?,?,?,?");
            
            SimpleDateFormat formato_fecha = new SimpleDateFormat("yyyy/MM/dd");
            
            String fecha1 = fecha_llamada;
            java.util.Date nfecha = formato_fecha.parse(fecha1);
            java.sql.Date fecha2 = new java.sql.Date(nfecha.getTime());
            
            String fecha12 = fecha_reservacion;
            java.util.Date n1fecha = formato_fecha.parse(fecha12);
            java.sql.Date fecha3 = new java.sql.Date(n1fecha.getTime());
           
            // Date fecha1 = formato_fecha.parse(fecha_llamada.getText());
            // java.sql.Date fechallamada =new java.sql.Date(fecha1.getTime());
                        
            llamada.setInt(1, Integer.parseInt(id_cliente));
            llamada.setInt(2, Integer.parseInt(id_reservacion));
            llamada.setInt(3, Integer.parseInt(id_mesa));
            llamada.setString(4, estado);
            llamada.setDate(5, fecha2);
            llamada.setDate(6, fecha3);
            
            llamada.execute();
            JOptionPane.showMessageDialog(null, "Los datos se han ingresado correctamente");   
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Error al ingresar"  + e.getMessage(), "error",JOptionPane.ERROR_MESSAGE);   
        }
        
    }
}
