/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package crud_restaurante;

import java.sql.*;
import javax.swing.JOptionPane;

public class cod_mesero {
    Connection restauranteBD = null;
    Statement consultasBD = null;
    ResultSet resultado = null;
    PreparedStatement sentencia = null; 
    
    String id, nombre, apellido,telefono;
    int id_aux;
    
    String sql;
    
    Boolean aviso = true;
    
    public void conexionBD (){
        try{
            restauranteBD = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Restaurante V2","postgres","postgres");
        }catch(SQLException e){
            System.out.println("Error al conectar: " + e.getMessage());
        }
    }
    public void insertar()throws SQLException{
        if(aviso == true){
            conexionBD();
            id = MESERO.idmesero.getText();
            nombre = MESERO.nombre.getText();
            apellido = MESERO.apellido.getText();
            telefono = MESERO.telefono.getText();
            id_aux = Integer.parseInt(id);
            
            sql = "insert into mesero(id_mesero, nomb_mesero, apell_mesero, telf_mesero) values(?,?,?,?)";
            sentencia = restauranteBD.prepareStatement(sql);
            
            sentencia.setInt(1, id_aux);
            sentencia.setString(2, nombre);
            sentencia.setString(3, apellido);
            sentencia.setString(4, telefono);
            
            sentencia.executeUpdate();
            JOptionPane.showMessageDialog(null, "Los datos se han ingresado correctamente");       
        }
    }
    
    
    public void modificar()throws SQLException{
        if(aviso == true){
            conexionBD();
           
            nombre = MESERO.nombre.getText();
            apellido = MESERO.apellido.getText();
            telefono = MESERO.telefono.getText();
            
            
            sql = "update mesero set nomb_mesero=?, apell_mesero=?, telf_mesero=? where id_mesero = '"+id+"' ";
            sentencia = restauranteBD.prepareStatement(sql);
            
            
            sentencia.setString(1, nombre);
            sentencia.setString(2, apellido);
            sentencia.setString(3, telefono);
         
            
            sentencia.executeUpdate();
            JOptionPane.showMessageDialog(null, "Los datos se han modificado correctamente");       
        }
    }
    
    public void borrar()throws SQLException{
        try{
            if(aviso == true){
                conexionBD();
                int confirmar = JOptionPane.showConfirmDialog(null, "¿Desea eliminar este campo?",
                        "Eliminar datos", JOptionPane.YES_NO_OPTION);
                if(confirmar != 1){
                    consultasBD.execute("delete from mesero where id_mesero = '"+id+"' ");
                    JOptionPane.showMessageDialog(null, "Se ha eliminado correctamente");
                }
            }
            
        }catch(SQLException e){
            JOptionPane.showConfirmDialog(null, "No es posible eliminar eliminar el dato seleccionado por conflicto con sus relaciones");
        }
    }
    
    public void consultar()throws SQLException{
        conexionBD();
        consultasBD = restauranteBD.createStatement();
        id = MESERO.idmesero.getText();
        resultado = consultasBD.executeQuery("select * from mesero where id_mesero= '"+id+"' ");
        if(resultado.next()){
            aviso = true;
            MESERO.nombre.setText(resultado.getString(2));
            MESERO.apellido.setText(resultado.getString(3));
            MESERO.telefono.setText(resultado.getString(4));
        }else{
            JOptionPane.showMessageDialog(null, "El id consultado no existe");
            aviso = false;
        }
    }
}
