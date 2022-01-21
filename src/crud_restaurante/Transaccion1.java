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
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author ALDAIR
 */
public class Transaccion1 {
    Connection restauranteBD = null;
    Statement consultasBD = null;
    ResultSet resultado = null;
    PreparedStatement sentencia = null; 
    CallableStatement llamada;
    
    String sql;
    
    Boolean aviso = true;
    
    String id_pago, id_factura, pago;
    int id_aux, id_aux2;
    Double id_aux3;
    
    //Método para conectar la base de datos :)
    public void conexionBD (){
        try{
            restauranteBD = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Restaurante V2","postgres","postgres");
        }catch(SQLException e){
            System.out.println("Error al conectar: " + e.getMessage());
        }       
    }
    
    public void pagofac(){
        conexionBD();
        id_pago = Transaccion_1.id_pago.getText();
        id_factura = Transaccion_1.id_factura.getText();
        pago = Transaccion_1.pago.getText();
        
        id_aux = Integer.parseInt(id_pago);
        id_aux2 = Integer.parseInt(id_factura);
        id_aux3 = Double.parseDouble(pago);
        try{
  
            llamada = restauranteBD.prepareCall("call transaccion_pagofactura2(?,?,?)");
            
            llamada.setInt(1, id_aux);
            llamada.setInt(2, id_aux2);
            llamada.setDouble(3, id_aux3);
            
            llamada.executeUpdate();
            JOptionPane.showMessageDialog(null, "Los datos se han ingresado correctamente");   
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Error al ingresar"  + e.getMessage(), "error",JOptionPane.ERROR_MESSAGE);   
        }
        
    }
    
}
