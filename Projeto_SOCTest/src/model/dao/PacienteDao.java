package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.Paciente;
import conexao.FabricaDeConexao;

public class PacienteDao {

	public String cadastrar(Paciente paciente) {

		Connection con=FabricaDeConexao.getConnection();
		PreparedStatement stmt = null;

		String sql="INSERT INTO paciente (nm_cmplt, idade, genero) VALUES (?,?,?)";

		try {
			int i = 0;
			stmt = con.prepareStatement(sql);
			stmt.setString(++i, paciente.getNm_cmplt());
			stmt.setInt(++i, paciente.getIdade());
			stmt.setString(++i, paciente.getGenero());

			stmt.executeUpdate();

			return "success";
		}catch (SQLException e) {
			System.err.println("Erro durante o registro"+e);
			return "failure";
		}finally {
			FabricaDeConexao.closeConnection(con, stmt);
		}
	}

	public List<Paciente> geTodos() {

		List<Paciente> pacientes = new ArrayList<Paciente>();
		Connection con = FabricaDeConexao.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql="SELECT * FROM paciente order by nm_cmplt";
	
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while(rs.next()) {

				Paciente paciente = new Paciente();

				paciente.setId(rs.getInt("id"));
				paciente.setNm_cmplt(rs.getString("nm_cmplt"));
				paciente.setIdade(rs.getInt("idade"));
				paciente.setGenero(rs.getString("genero"));

				pacientes.add(paciente);
			}
		}catch(SQLException e){
			System.err.println("Erro"+ e);
		}finally {
			FabricaDeConexao.closeConnection(con, stmt ,rs);
		}
		return pacientes;
	}
	
	public Paciente detalhar(int codigo) {

		Paciente paciente = new Paciente();

		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con=FabricaDeConexao.getConnection();

		String sql="SELECT * FROM paciente WHERE id =?";

		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, codigo);
			rs = stmt.executeQuery();

			if(rs.next()) {
				
				paciente = new Paciente();

				paciente.setId(rs.getInt("id"));
				paciente.setNm_cmplt(rs.getString("nm_cmplt"));
				paciente.setIdade(rs.getInt("idade"));
				paciente.setGenero(rs.getString("genero"));
			}
			return paciente;
		}catch(SQLException e){
			System.err.println("Error"+e);
		}finally {
			FabricaDeConexao.closeConnection(con, stmt ,rs);
		}
		return paciente;
	}

	public String atualizar(Paciente paciente) {

		PreparedStatement stmt = null;
		Connection con = FabricaDeConexao.getConnection();
		String sql = "UPDATE paciente SET nm_cmplt=? , idade=? , genero=? WHERE id=?";

		try {
			int i = 0;
			stmt = con.prepareStatement(sql);
			stmt.setString(++i, paciente.getNm_cmplt());
			stmt.setInt(++i, paciente.getIdade());
			stmt.setString(++i, paciente.getGenero());
			stmt.setInt(++i, paciente.getId());

			stmt.executeUpdate();

			return "success";
		} catch (SQLException e) {
			System.err.println("Ocorreu um erro " + e);
			return "failure";
		} finally {
			FabricaDeConexao.closeConnection(con, stmt);
		}
	}

}

