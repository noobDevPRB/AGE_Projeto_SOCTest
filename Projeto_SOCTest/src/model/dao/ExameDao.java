package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.Exame;
import model.bean.Paciente;
import conexao.FabricaDeConexao;

public class ExameDao {
	
	public String cadastrar(Exame exame) {
			java.sql.Date sqlDate = new java.sql.Date(exame.getExm_data().getTime());
			Connection con=FabricaDeConexao.getConnection();
			PreparedStatement stmt = null;
			
			String sql="INSERT INTO exame (id_pcnt, nm_exame , exm_data, resultado ) VALUES (?,?,?,?)";
			
			try { 
				int i = 0;
				stmt = con.prepareStatement(sql);
				stmt.setInt(++i, exame.getId_pcnt());
				stmt.setString(++i, exame.getNm_exame());
				stmt.setDate(++i, sqlDate);
				stmt.setString(++i, exame.getResultado());
		
				stmt.executeUpdate();
				
				return "success";
			}catch (SQLException e) {
				System.err.println("Erro durante o registro"+e);
				return "failure";
			}finally {
				FabricaDeConexao.closeConnection(con, stmt);
			}
		
		}

	public List<Exame> getTodos() {
		
		List<Exame> exames = new ArrayList<Exame>();
		Connection con = FabricaDeConexao.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
			
		String sql="SELECT * FROM exame INNER JOIN paciente ON  exame.id_pcnt = paciente.id order by paciente.nm_cmplt, exame.nm_exame";

		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Paciente paciente = new Paciente();
				Exame exame = new Exame();
				
				exame.setId(rs.getInt("exame.id"));
				paciente.setNm_cmplt(rs.getString("paciente.nm_cmplt"));
				exame.setNm_exame(rs.getString("exame.nm_exame"));
				exame.setExm_data(rs.getDate("exame.exm_data"));			
				exame.setExamePaciente(paciente);
								
				exames.add(exame);
			}
			
		}catch(SQLException e){
			System.err.println("Erro"+ e);
			
		}finally {
			FabricaDeConexao.closeConnection(con, stmt ,rs);
		}
		return exames;
	}
	
	public Exame getExamePorId(int id_exame) {
		Paciente paciente = new Paciente();
		Exame exame = new Exame();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;		
		Connection con=FabricaDeConexao.getConnection();
		
		String sql="SELECT * FROM exame INNER JOIN paciente ON  exame.id_pcnt = paciente.id WHERE exame.id =?";
		
		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id_exame);
			rs = stmt.executeQuery();
			
			if(rs.next()) {	
						
				exame.setId(rs.getInt("id"));
				exame.setId_pcnt(rs.getInt("id_pcnt"));
				exame.setNm_exame(rs.getString("nm_exame"));
				exame.setExm_data(rs.getDate("exm_data"));
				exame.setResultado(rs.getString("resultado"));
				paciente.setNm_cmplt(rs.getString("paciente.nm_cmplt"));
				paciente.setGenero(rs.getString("paciente.genero"));
				paciente.setIdade(rs.getInt("paciente.idade"));
				paciente.setId(rs.getInt("paciente.id"));
				exame.setExamePaciente(paciente);
			}	
			return exame;
			
		}catch(SQLException e){
			System.err.println("Error"+e);		
		}finally {
			FabricaDeConexao.closeConnection(con, stmt ,rs);
		}	
		return exame;
	}
	
	public String atualizar(Exame exame) {
		java.sql.Date sqlDate = new java.sql.Date(exame.getExm_data().getTime());

		PreparedStatement stmt = null;
		Connection con = FabricaDeConexao.getConnection();
		String sql = "UPDATE exame SET id_pcnt =?, nm_exame =?, exm_data =?, resultado =? WHERE id=?";

		try {
			int i = 0; 
			stmt = con.prepareStatement(sql);
			stmt.setInt(++i, exame.getId_pcnt());
			stmt.setString(++i, exame.getNm_exame());
			stmt.setDate(++i, sqlDate);
			stmt.setString(++i, exame.getResultado());			
			stmt.setInt(++i, exame.getId());

			stmt.executeUpdate();

			return "success";
		} catch (SQLException e) {
			System.err.println("Ocorreu um erro " + e);
			return "failure";
		} finally {
			FabricaDeConexao.closeConnection(con, stmt);
		}
	}
	
	public String deletar(int id_exame) {
		
		PreparedStatement stmt = null;	
		Connection con = FabricaDeConexao.getConnection();
		
		String sql = "DELETE FROM exame WHERE id = ?";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id_exame);
			stmt.executeUpdate();
			
			return "success";	
		} catch (SQLException e) {
			System.err.println(e);
			return "failure";
		} finally {
			FabricaDeConexao.closeConnection(con, stmt);
		}
	}
}

