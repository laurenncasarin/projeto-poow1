package br.csi.dao;

import br.csi.model.Avaliacao;
import br.csi.model.Filme;
import br.csi.util.ConectDBPostgres;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AvaliacaoDAO {

    public ArrayList<Avaliacao> getAvaliacoes() {
        ConectDBPostgres cdb = new ConectDBPostgres();
        ArrayList<Avaliacao> avaliacoes = new ArrayList<>();

        try {
            PreparedStatement stmt = cdb.getConecao().prepareStatement("SELECT * FROM avaliacao");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Avaliacao a = new Avaliacao(
                        rs.getInt("idavaliacao"),
                        rs.getInt("idfilme"),
                        rs.getFloat("nota")
                );
                avaliacoes.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return avaliacoes;
    }


    public Avaliacao obterAvaliacao(int usuarioId, int filmeId) {
        try {
            ConectDBPostgres cdb = new ConectDBPostgres();
            PreparedStatement stmt = cdb.getConecao().prepareStatement("SELECT nota FROM avaliacao WHERE idusuario = " +
                    "? AND idfilme = ?");
            stmt.setInt(1, usuarioId);
            stmt.setInt(2, filmeId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    float nota = rs.getFloat("nota");
                    return new Avaliacao(usuarioId, filmeId, nota);
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void salvarAvaliacao(Integer usuarioId, Integer filmeId, Float nota) {
        System.out.println("TA NO DAO AVA salvar Avaliacao");
        ConectDBPostgres cdb = new ConectDBPostgres();
        System.out.println("idfilme: no dao " + filmeId);
        System.out.println("idusuario: NO DAOO " + usuarioId);
        if (existeAvaliacao(usuarioId, filmeId)) {//aqui manda pra outra funcao pra ver se ja fez avaliacao
            try {
                PreparedStatement stmt = cdb.getConecao().prepareStatement("UPDATE avaliacao SET nota = ? WHERE idusuario = " +
                        "? AND idfilme = ?");
                System.out.println("JA TEM AVALIACAO, ATUALIZA A NOTA");
                stmt.setFloat(1, nota);
                stmt.setInt(2, usuarioId);
                stmt.setInt(3, filmeId);
                stmt.execute();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                PreparedStatement stmt = cdb.getConecao().prepareStatement("INSERT INTO avaliacao (idusuario, idfilme, nota) " +
                        "VALUES (?, ?, ?)");
                System.out.println("NAO TEMM TEM AVALIACAO");
                stmt.setInt(1, usuarioId);
                stmt.setInt(2, filmeId);
                stmt.setFloat(3, nota);
                stmt.execute();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    private boolean existeAvaliacao(Integer usuarioId, Integer filmeId) {//funcao que ve se ja tem avaliacao pra da o update
        try {
            ConectDBPostgres cdb = new ConectDBPostgres();
            PreparedStatement stmt = cdb.getConecao().prepareStatement("SELECT 1 FROM avaliacao WHERE idusuario = " +
                    "? AND " + "idfilme = ?");
            stmt.setInt(1, usuarioId);
            stmt.setInt(2, filmeId);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Filme> minhasAvaliacoes(int idUsuario) {
        ConectDBPostgres cdb = new ConectDBPostgres();
        List<Filme> filmesAvaliados = new ArrayList<>();
        try {
            PreparedStatement pstmt = cdb.getConecao().prepareStatement("SELECT f.idfilme, f.nomefilme, f.ano, f.categoria, f.descricao, f.imagem, f.notamedia " +
                    "FROM filme f " +
                    "INNER JOIN avaliacao a ON f.idfilme = a.idfilme " +
                    "WHERE a.idusuario = ?");
            pstmt.setInt(1, idUsuario);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Filme filme = new Filme(
                        rs.getInt("idfilme"),
                        rs.getString("nomefilme"),
                        rs.getString("ano"),
                        rs.getString("categoria"),
                        rs.getString("descricao"),
                        rs.getString("imagem"),
                        rs.getFloat("notamedia")
                );
                filmesAvaliados.add(filme);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return filmesAvaliados;
        }
        return filmesAvaliados;
    }

}
