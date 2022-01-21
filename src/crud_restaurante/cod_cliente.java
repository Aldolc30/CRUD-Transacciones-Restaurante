/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package crud_restaurante;

// Importar librerías necesarias 
import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author ALDAIR
 */
public class cod_cliente {
    Connection restauranteBD = null;
    Statement consultasBD = null;
    ResultSet resultado = null;
    PreparedStatement sentencia = null; 
    
    String id, nombre, apellido, cedula, telefono, correo, direccion;
    int id_aux;
    
    String sql;
    
    Boolean aviso = true;
    
    
    //Método para conectar la base de datos :)
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
            id = CLIENTE.campo1.getText();
            nombre = CLIENTE.campo2.getText();
            apellido = CLIENTE.campo3.getText();
            cedula = CLIENTE.campo4.getText();
            telefono = CLIENTE.campo5.getText();
            correo = CLIENTE.campo6.getText();
            direccion = CLIENTE.campo7.getText();
            id_aux = Integer.parseInt(id);
            
            sql = "insert into cliente(id_cliente, nomb_cliente, apell_cliente, cedula, telf_cliente, email_cliente, direccion_cliente) values(?,?,?,?,?,?,?)";
            sentencia = restauranteBD.prepareStatement(sql);
            
            sentencia.setInt(1, id_aux);
            sentencia.setString(2, nombre);
            sentencia.setString(3, apellido);
            sentencia.setString(4, cedula);
            sentencia.setString(5, telefono);
            sentencia.setString(6, correo);
            sentencia.setString(7, direccion);
            
            sentencia.executeUpdate();
            JOptionPane.showMessageDialog(null, "Los datos se han ingresado correctamente");       
        }
    }
    
    public void modificar()throws SQLException{
        if(aviso == true){
            conexionBD();
           
            nombre = CLIENTE.campo2.getText();
            apellido = CLIENTE.campo3.getText();
            cedula = CLIENTE.campo4.getText();
            telefono = CLIENTE.campo5.getText();
            correo = CLIENTE.campo6.getText();
            direccion = CLIENTE.campo7.getText();
            
            
            sql = "update cliente set nomb_cliente=?, apell_cliente=?, cedula=?, telf_cliente=?, email_cliente=?, direccion_cliente=? "
                    + "where id_cliente = '"+id+"' ";
            sentencia = restauranteBD.prepareStatement(sql);
            
            
            sentencia.setString(1, nombre);
            sentencia.setString(2, apellido);
            sentencia.setString(3, cedula);
            sentencia.setString(4, telefono);
            sentencia.setString(5, correo);
            sentencia.setString(6, direccion);
            
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
                    consultasBD.execute("delete from cliente where id_cliente = '"+id+"' ");
                    JOptionPane.showMessageDialog(null, "Se ha eliminado correctamente");
                }
            }
        }catch(SQLException e){
            JOptionPane.showConfirmDialog(null, "No es posible eliminar eliminar el dato seleccionado por conflicto con llaves");
        }
    }
    
    public void consultar()throws SQLException{
        conexionBD();
        consultasBD = restauranteBD.createStatement();
        id = CLIENTE.campo1.getText();
        resultado = consultasBD.executeQuery("select * from cliente where id_cliente= '" + id+"' ");
        if(resultado.next()){
            aviso = true;
            CLIENTE.campo2.setText(resultado.getString(2));
            CLIENTE.campo3.setText(resultado.getString(3));
            CLIENTE.campo4.setText(resultado.getString(4));
            CLIENTE.campo5.setText(resultado.getString(5));
            CLIENTE.campo6.setText(resultado.getString(6));
            CLIENTE.campo7.setText(resultado.getString(7));
        }else{
            JOptionPane.showMessageDialog(null, "El id consultado no existe");
            aviso = false;
        }
    }
}

