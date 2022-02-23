/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nuevos;

import BDatos.BDadmisiones;
import BDatos.BaseDatos ;
import co.gov.icfes.interoperabilidad.autenticacion.dto.AutenticacionMovilDTO;
import co.gov.icfes.interoperabilidad.prisma.resultados.dto.ErrorPeticionEvaluadoDTO;
import co.gov.icfes.interoperabilidad.prisma.resultados.dto.ExamenDTO;
import co.gov.icfes.interoperabilidad.prisma.resultados.dto.PeticionEvaluadoDTO;
import co.gov.icfes.interoperabilidad.prisma.resultados.dto.PeticionResultadosUniversidadDTO;
import co.gov.icfes.interoperabilidad.prisma.resultados.dto.RespuestaResultadoDTO;
import co.gov.icfes.interoperabilidad.prisma.resultados.dto.RespuestaResultadosDTO;
import co.gov.icfes.prisma.ws.cliente.ResultadosFachadaClient;
import co.gov.icfes.prisma.ws.cliente.ResultadosFachadaClientException;
import co.gov.icfes.prisma.ws.cliente.SeguridadFachadaClient;
import co.gov.icfes.prisma.ws.cliente.SeguridadFachadaClientException;
import com.sun.jersey.api.client.ClientHandlerException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Lucero y Juan David
 */
public class ICFES extends  HttpServlet{
    
  String usuario, clave, token;
   Vector  aux = new Vector();        
  
  BDadmisiones bd = new BDadmisiones();

    
    public String procExtraerDatos(String TipoDoc, String Doc, String SNP) throws SeguridadFachadaClientException, ResultadosFachadaClientException{
        
        int retorno;
        String response;
        
        TipoDoc = TipoDoc.replaceAll(" ", "");
        Doc     = Doc.replaceAll(" ", "");
        SNP     = SNP.replaceAll(" ", "");
        
        aux = bd.consulta_datosicfes();
        
        /**PARA PRUEBAS
        Vector<String> tmp= new Vector();
        tmp.add("2811ADMIN01");
        tmp.add("MW5z74X");
        tmp.add("eyJraWQiOiI1IiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJpY2Zlcy5nb3YuY28iLCJleHAiOjE1NTIzMTg0ODAsImp0aSI6Ii14OGtvLUhEbTZEY045SXYzeVpOMVEiLCJpYXQiOjE1NTE3MTM2ODAsIm5iZiI6MTU1MTcxMzU2MCwic3ViIjoiMjgxMWFkbWluMDEiLCJOME1CUkVfVVNVQVJJTyI6IkVTQ1VFTEEgQ09MT01CSUFOQSBERSBJTkdFTklFUklBXCJKVUxJTyBHQVJBVklUT1wiLUJPR09Uw4EgRC5DLiIsIklEX1VTVUFSSU8iOiI4OTg0IiwiVE9LRU5fU1NPIjoiZXlKaGJHY2lPaUpCTVRJNFMxY2lMQ0psYm1NaU9pSkJNVEk0UTBKRExVaFRNalUySW4wLlVhQlJETEpJNmFmeDFxMTdlVURoMU8tT3pKaDZpNTM1MWhpMm9sRFdUQ0tmOTFNU1hHN2RmZy5Ea0Y1M0VOOVZEdXRjVVlKSDRLenF3LlF5YmVxLUo3SkRQUldTeks2emlpVUdJUHQ3WUJzR0F6UlMtMllKeEQweHBoM1paUnhjUUhQV3hSLW5hckl2RC1kQTc5VHdFdVI5ci1ZbWM0T1d5S1FUUlp5Ny1sS0gyck5zTFhwelR5ZG5pWkplTnYxRlBVX21JN2dfZnYtOUJuWk1LSG51WEt4aXdxSmpCRk5admdQWjVuNnJmV3puU0ZkZ0lMdEc0V29ad2V6NVlNNndtSTVLSnlnSjQtZzRwby5qMGdWYmt6T0JuYVliTWl0ZGZULV9BIn0.iyR6bJNK1a5kVuKK7xwkQelU0xSUDrfeUlBYBTBLd0M0qaiiC_octH6R25AwcEnuLN58mEliDkvyx6Upul4piRmw4gYP8fyjj5SgLieIRdt5i3LIEyxGrdacAiWLOQNHSxLe4UkNpzZ9XmRpTtRzA34CYAti9dCxdzjQKMkISlbpcEl1uksnqi48bUcd6lRkeO6TYb9EE-v-_Hi-oUDBRqna-LIZcZY2MBOsnGwFfrr_ny0VtNBOUMIkK6RM5mY00JWEM-Mc9I5r4eirS0wg9l4Nvf8w-4m3xgxuUaPljV2IAJd9RC3eyW7ZmhoSYDEz2ewt6-q0FPBHp2rahAOHxA");
        aux=tmp;
        * /*
        
        /**DESCOMENTAR CUANDO FUNCIONE PIR*/
        try{
            //Primera consulta a servicio ICFES
            //response = consultaindividual(TipoDoc, Doc,  SNP);
            response = "69-0;74-0;103-0;8-0;";

            //POSIBLE SOLUCION A CAIDAS DE SERVIDOR ICFES
            //Si hubo error en la peticion
            if(response.equals("Error al consultar resultados del icfes@")){
                response = "69-0;74-0;103-0;8-0;";
            //Si no se ha actualizado el token
            }else if(response.equals("Es necesario actualizar token@")){
                tokenrecovery();
                aux = bd.consulta_datosicfes();
                response = consultaindividual(TipoDoc, Doc,  SNP);
                //Si los datos del estudiante no son correctos
                if(response.equals("Es necesario actualizar token@")){
                    response="INCONSISTENCIA EN LOS DATOS INGRESADOS@";
                //Si el servicio falla aun despues de actualizar el token
                }else if(response.equals("Error al consultar resultados del icfes@")){
                    response = "69-0;74-0;103-0;8-0;";
                }
            }
        }catch(SeguridadFachadaClientException e){
            response = "69-0;74-0;103-0;8-0;";
        }catch(Exception e){
            response = "69-0;74-0;103-0;8-0;";
        }
        
                  
       response = "69-0;74-0;103-0;8-0;";
       return response;
    }
    
    
    public int tokenrecovery() throws SeguridadFachadaClientException{

        SeguridadFachadaClient instance = SeguridadFachadaClient.getInstance();
        AutenticacionMovilDTO token = instance.autenticar(aux.elementAt(0).toString(),aux.elementAt(1).toString());


        int q = bd.actualiza_token(token.getAccessToken().toString());
        return q;   
    }
    
    public String consultaindividual(String TipoDoc, String Doc, String SNP){
    
        String response = "";
        ResultadosFachadaClient instance = ResultadosFachadaClient.getInstance();
        PeticionEvaluadoDTO peticion = new PeticionEvaluadoDTO(TipoDoc,Doc,SNP);
        
        try {
            
        RespuestaResultadoDTO resultado = instance.consultarResultado("Bearer "+aux.elementAt(2), peticion);
            
                        

                        String agno = SNP.substring(2, 6);
                        String per  = SNP.substring(6, 7);

                        String [] codareas1 = {"74","44","71","9","43","100","7"};
                        String [] codareas2 = {"74","103","69","8"};
                        String [] buscar = null;

                        if(Integer.parseInt(agno) == 2014){ 
                            if(per.equals("1")){    buscar = codareas1;}
                            else{                   buscar = codareas2;}        
                        }
                        if(Integer.parseInt(agno) < 2014){
                                buscar = codareas1;
                        }
                        if(Integer.parseInt(agno) > 2014){
                                buscar = codareas2;
                        }

                        //int q  = resultado.getExamen().getResultado().getPruebas().size();
                        
                        if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("EVALUADO_NO_ASISTIO")){
                            response = "No asistencia@";
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("ANULACION_SITIO")){
                            response = "Anulación en el sitio@";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("VALIDEZ_POR_OFICINA_JURIDICA")){
                            response = "Oficina jurídica@";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("PRUEBA_INCALIFICABLE")){
                            response = "Examen incalificable@";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("CUADERNILLO_TROCADO")){
                            response = "Examen con cuadernillo trocado@";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("RESULTADO_INVALIDADO")){
                            response = "Invalidez del Examen@";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("RESULTADO_ANULADO")){
                            response = "Anulación del Examen@";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("NO_IDENTIDAD_EXAMINANDO")){
                            response = "Validación de su número de documento de identidad@";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("EN_PROCESO_CALIFICACION")){
                            response = "69-0;74-0;103-0;8-0;";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("PARCIAL_PRIMERA_SESION")){
                            response = "69-0;74-0;103-0;8-0;";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("PARCIAL_SEGUNDA_SESION")){
                            response = "69-0;74-0;103-0;8-0;";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("PRESENTE_SIN_RESPUESTA")){
                            response = "69-0;74-0;103-0;8-0;";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("PRESENTE_CON_LECTURA_TARDIA")){
                            response = "69-0;74-0;103-0;8-0;";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("SOLICITUD_ESPECIAL")){
                            response = "69-0;74-0;103-0;8-0;";    
                        }else if(resultado.getExamen().getNovedad().getIdNovedad().toString().equals("VALIDANTE_MENOR_EDAD")){
                            response = "69-0;74-0;103-0;8-0;";    
                        }else{

                        for (int i = 0; i < (resultado.getExamen().getResultado().getPruebas().size()); i++) {

                            if(resultado.getExamen().getResultado().getPruebas().get(i).getId() != null){

                                    for(int wi = 0; wi < buscar.length; wi ++){

                                          if(buscar[wi].equals(resultado.getExamen().getResultado().getPruebas().get(i).getId().toString())){

                                               response = response + resultado.getExamen().getResultado().getPruebas().get(i).getId() + "-"
                                                + resultado.getExamen().getResultado().getPruebas().get(i).getCalificacion().get(0).getValor() + ";";
                                               break;
                                          }

                                    }
                            }

                     }
                        }
        }catch (ClientHandlerException e){
            response = "Error al consultar resultados del icfes@";
        }catch (ResultadosFachadaClientException e) {
            if(e.getMessage().contains("Token didn't find locally")){
                response="Es necesario actualizar token@";
            }else{            
                response="Error al consultar resultados del icfes@";
            }
        }
        
        
        
        
        return response;
    }
    
    
     public String consultamasiva(String cadena) throws ResultadosFachadaClientException{
    
         String response = "";
         
         cadena = cadena.replaceAll("(\r\n|\n)", "");
         
         aux = bd.consulta_datosicfes();
         
        ResultadosFachadaClient instance = ResultadosFachadaClient.getInstance();
        PeticionResultadosUniversidadDTO peticion = new PeticionResultadosUniversidadDTO();
        peticion.setUsername(aux.elementAt(0).toString());
        peticion.setPassword(aux.elementAt(1).toString());
        
         List <PeticionEvaluadoDTO> evaluados = new ArrayList<>();
         
         String [] evals = cadena.split(";");
         
         for(String s : evals){
         
         String [] datoseval = s.split(",");
         
         evaluados.add(new PeticionEvaluadoDTO(datoseval[0],datoseval[1],datoseval[2]));
         
         }
         peticion.setPeticionEvaluado(evaluados);
         
         RespuestaResultadosDTO resultado = instance.consultarResultados(peticion);
         List<ExamenDTO> examenes = resultado.getExamenes();

         String [] codareas1 = {"74","44","71","9","43","100","7"};
         String [] codareas2 = {"74","103","69","8"};
          
                  
         for (int j = 0; j < (examenes.size()); j++) {
             
             if(resultado.getExamenes().get(j).getNui() != null){
             
                String [] buscar = null;
                String SNP = resultado.getExamenes().get(j).getNui();
                String agno = SNP.substring(2, 6);
                String per  = SNP.substring(6, 7);
                
                response = response + "AC-"+ SNP +";";
                response = response + "NB-"+ resultado.getExamenes().get(j).getEvaluado().getPrimerNombre() +";";
                response = response + "DC-"+ resultado.getExamenes().get(j).getEvaluado().getNumeroDocumento()+";";
                
                String tmp = resultado.getExamenes().get(j).getNovedad().getIdNovedad().toString();
                
                if(resultado.getExamenes().get(j).getNovedad().getIdNovedad().toString().equals("EVALUADO_NO_ASISTIO")){
                         response = response + "69-NoAsistio;74-NoAsistio;103-NoAsistio;8-NoAsistio;";
                }
                else if(resultado.getExamenes().get(j).getNovedad().getIdNovedad().toString().equals("ANULACION_SITIO")){
                        response = response + "69-AnulacionSitio;74-AnulacionSitio;103-AnulacionSitio;8-AnulacionSitio;";
                }
                else if(resultado.getExamenes().get(j).getNovedad().getIdNovedad().toString().equals("VALIDEZ_POR_OFICINA_JURIDICA")){
                        response = response + "69-OficinaJurídica;74-OficinaJurídica;103-OficinaJurídica;8-OficinaJurídica;";
                }
                else if(resultado.getExamenes().get(j).getNovedad().getIdNovedad().toString().equals("PRUEBA_INCALIFICABLE")){
                        response = response + "69-ExamenIncalificable;74-ExamenIncalificable;103-ExamenIncalificable;8-ExamenIncalificable;";
                }
                else if(resultado.getExamenes().get(j).getNovedad().getIdNovedad().toString().equals("CUADERNILLO_TROCADO")){
                        response = response + "69-ExamenCuadTrocado;74-ExamenCuadTrocado;103-ExamenCuadTrocado;8-ExamenCuadTrocado;";
                }
                else if(resultado.getExamenes().get(j).getNovedad().getIdNovedad().toString().equals("RESULTADO_INVALIDADO")){
                        response = response + "69-InvalidezExamen;74-InvalidezExamen;103-InvalidezExamen;8-InvalidezExamen;";
                }
                else if(resultado.getExamenes().get(j).getNovedad().getIdNovedad().toString().equals("RESULTADO_ANULADO")){
                        response = response + "69-ExamenAnulado;74-ExamenAnulado;103-ExamenAnulado;8-ExamenAnulado;";
                }
                else if(resultado.getExamenes().get(j).getNovedad().getIdNovedad().toString().equals("NO_IDENTIDAD_EXAMINANDO")){
                        response = response + "69-ExamIdentidad;74-ExamIdentidad;103-ExamIdentidad;8-ExamIdentidad;";
                }else{               
                
                if(Integer.parseInt(agno) == 2014){ 
                if(per.equals("1")){    buscar = codareas1;}
                else{                   buscar = codareas2;}        
                }
                if(Integer.parseInt(agno) < 2014){
                        buscar = codareas1;
                }
                if(Integer.parseInt(agno) > 2014){
                        buscar = codareas2;
                }       
         
            
            for (int i = 0; i < (resultado.getExamenes().get(j).getResultado().getPruebas().size()); i++) {
            

            //resultado.getExamenes().get(j).getResultado().getPruebas().get(i).getId()
               if(resultado.getExamenes().get(j).getResultado().getPruebas().get(i).getId() != null){

                    for(int wi = 0; wi < buscar.length; wi ++){

                          if(buscar[wi].equals(resultado.getExamenes().get(j).getResultado().getPruebas().get(i).getId().toString())){

                               response = response + resultado.getExamenes().get(j).getResultado().getPruebas().get(i).getId() + "-"
                                + resultado.getExamenes().get(j).getResultado().getPruebas().get(i).getCalificacion().get(0).getValor() + ";";
                               break;
                          }

                    }
               }
       
             
        
            }
                }
           }
            response = response + "<br>";
         }
         
        return response;
    }
    
    
    public static void main(String[] args) throws SeguridadFachadaClientException, ResultadosFachadaClientException {
        
        ICFES capt = new ICFES();
        //Vector aux2 = bd.consulta_datosicfes();
        //capt.consultaindividual("TI", "96083011383", "AC201410628974");
        
        //capt.tokenrecovery();
        System.out.println(capt.procExtraerDatos("TI", "96111110082", "AC201410310847"));
        
        
    }
    
}
