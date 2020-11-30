package dominio;

//import com.org.jacoco;
//package com.example.jacoco;
import org.dbunit.Assertion;
import org.dbunit.DBTestCase;
import org.dbunit.PropertiesBasedJdbcDatabaseTester;
import org.dbunit.database.DatabaseConfig;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.ITable;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSetBuilder;
import org.dbunit.ext.mysql.MySqlDataTypeFactory;
import org.dbunit.operation.DatabaseOperation;
import java.io.FileInputStream;
import java.sql.SQLException;
import org.junit.Test;
import static junit.framework.TestCase.assertEquals;

 
 
public class novotesteJUNIT extends DBTestCase{
     private FlatXmlDataSet bancoCarregado;
   
   
    public novotesteJUNIT(String name){
        super(name);
        System.setProperty(
                PropertiesBasedJdbcDatabaseTester.DBUNIT_DRIVER_CLASS,"com.mysql.jdbc.Driver");
        System.setProperty(
                PropertiesBasedJdbcDatabaseTester.DBUNIT_CONNECTION_URL,"jdbc:mysql://WEBSOFT.chlhdmd5beba.us-east-1.rds.amazonaws.com:3306/WEBSOFT");
        System.setProperty(
                PropertiesBasedJdbcDatabaseTester.DBUNIT_USERNAME,"SGE");
        System.setProperty(
                PropertiesBasedJdbcDatabaseTester.DBUNIT_PASSWORD,"alebeodeiadualboot2020");
    }
    
    protected IDataSet getDataSet() throws Exception{
        bancoCarregado = new FlatXmlDataSetBuilder().build(new FileInputStream("C:\\Users\\vinye\\OneDrive\\Documentos\\NetBeansProjects\\Projetos de Maven\\src\\test\\java\\dominio\\conjuntodados\\dataset.xml"));
        return bancoCarregado;
    }
   
    
    //Atualiza antes de inserir
    protected DatabaseOperation getSetUpOperation()throws Exception{
        return DatabaseOperation.REFRESH;
    }
    
    //Não faz nada depois que insere    
   
    protected DatabaseOperation getTearDownOperation() throws Exception{
        return DatabaseOperation.NONE;
    }
    
    @Override
    protected void setUpDatabaseConfig(DatabaseConfig config){
        config.setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY, new MySqlDataTypeFactory());
    }
   /*
    public void testRegistrosBanco() throws Exception{
        IDataSet dadosSetBanco = getConnection().createDataSet();
        ITable dadosNoBanco = dadosSetBanco.getTable("CEO");
        IDataSet dadosSetEsperado = new FlatXmlDataSetBuilder().build(new FileInputStream("C:\\Users\\vinye\\OneDrive\\Documentos\\NetBeansProjects\\Projetos de Maven\\src\\test\\java\\dominio\\conjuntodados\\dataset.xml"));
        ITable dadosEsperados = dadosSetEsperado.getTable("CEO");
        Assertion.assertEquals(dadosEsperados, dadosNoBanco);
    }
*/
    
    public void testQtdeRegistroTabela() throws Exception{
        IDataSet dadosSetBanco = getConnection().createDataSet();
        int rowCount = dadosSetBanco.getTable("CEO").getRowCount();
        assertEquals(10,rowCount);
                
    }
    
    public void testNomeEspecifico() throws Exception, SQLException, Throwable{
        ITable actualJoinData = getConnection().createQueryTable("s", "SELECT nomeCeo FROM  CEO WHERE empresa='ratinho'");
        assertEquals("Xaropinho", actualJoinData.getValue(0,"nomeCeo"));
    }

}
