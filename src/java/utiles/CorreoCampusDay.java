/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utiles;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


/**
 *
 * @author andres.rojas
 */
public class CorreoCampusDay {
    private String origen, destino, error, smtp;
    private String mensaje;
    private boolean envio;
    

    
    public boolean enviar(String asunto, String destino) {
     //   MimeMultipart multipart = new MimeMultipart();
      //  Properties properties = new Properties();
      //  properties.put("mail.smtp.host", this.smtp);
       // Session session = Session.getDefaultInstance(properties, null);
      //  session.setDebug(true);
       try {
            smtp = "smtp.office365.com";
            MimeMultipart multipart = new MimeMultipart();
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", smtp);
            properties.put("mail.smtp.port", "587");
            Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("mercadeo@escuelaing.edu.co", "Merca.2016");
                }
            });

            session.setDebug(true);
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("mercadeo@escuelaing.edu.co"));
            msg.setRecipients(Message.RecipientType.BCC, destino);
            msg.setSubject(asunto);
            msg.setSentDate(new Date());
            // texto = Datos + "\n\n";
            msg.setContent(this.getHtml(), "text/html; charset=utf-8");
            //msg.setContent(multipart);
            //msg.setText(this.getHtml(), "text/html; charset=utf-8");
            //msg.setText("Hola", "ISO-8859-1");
            Transport.send(msg);
            // mensaje = "ok";
            this.envio=true;
        } catch (Exception e) {
            this.error = "Problemas con el envio del correo " + e.getMessage();
            this.envio = false;
        }
        return this.envio;
    }

    public String getMensaje() {
        return this.error;
    }
    
    private String getHtml(){
        return "<html xmlns:v=\"urn:schemas-microsoft-com:vml\"\n" +
"xmlns:o=\"urn:schemas-microsoft-com:office:office\"\n" +
"xmlns:w=\"urn:schemas-microsoft-com:office:word\"\n" +
"xmlns:m=\"http://schemas.microsoft.com/office/2004/12/omml\"\n" +
"xmlns=\"http://www.w3.org/TR/REC-html40\">\n" +
"\n" +
"<head>\n" +
"<meta http-equiv=Content-Type content=\"text/html; charset=windows-1252\">\n" +
"<meta name=ProgId content=Word.Document>\n" +
"<meta name=Generator content=\"Microsoft Word 15\">\n" +
"<meta name=Originator content=\"Microsoft Word 15\">\n" +
"<link rel=File-List href=\"CampusDay_archivos/filelist.xml\">\n" +
"<!--[if gte mso 9]><xml>\n" +
" <o:DocumentProperties>\n" +
"  <o:Author>MERCADEO</o:Author>\n" +
"  <o:LastAuthor>MERCADEO</o:LastAuthor>\n" +
"  <o:Revision>2</o:Revision>\n" +
"  <o:TotalTime>2</o:TotalTime>\n" +
"  <o:Created>2018-10-26T23:00:00Z</o:Created>\n" +
"  <o:LastSaved>2018-10-27T00:13:00Z</o:LastSaved>\n" +
"  <o:Pages>1</o:Pages>\n" +
"  <o:Words>200</o:Words>\n" +
"  <o:Characters>1103</o:Characters>\n" +
"  <o:Lines>9</o:Lines>\n" +
"  <o:Paragraphs>2</o:Paragraphs>\n" +
"  <o:CharactersWithSpaces>1301</o:CharactersWithSpaces>\n" +
"  <o:Version>16.00</o:Version>\n" +
" </o:DocumentProperties>\n" +
" <o:OfficeDocumentSettings>\n" +
"  <o:AllowPNG/>\n" +
" </o:OfficeDocumentSettings>\n" +
"</xml><![endif]-->\n" +
"<link rel=themeData href=\"CampusDay_archivos/themedata.thmx\">\n" +
"<link rel=colorSchemeMapping href=\"CampusDay_archivos/colorschememapping.xml\">\n" +
"<!--[if gte mso 9]><xml>\n" +
" <w:WordDocument>\n" +
"  <w:SpellingState>Clean</w:SpellingState>\n" +
"  <w:GrammarState>Clean</w:GrammarState>\n" +
"  <w:TrackMoves>false</w:TrackMoves>\n" +
"  <w:TrackFormatting/>\n" +
"  <w:HyphenationZone>21</w:HyphenationZone>\n" +
"  <w:PunctuationKerning/>\n" +
"  <w:ValidateAgainstSchemas/>\n" +
"  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\n" +
"  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\n" +
"  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\n" +
"  <w:DoNotPromoteQF/>\n" +
"  <w:LidThemeOther>ES-CO</w:LidThemeOther>\n" +
"  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\n" +
"  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\n" +
"  <w:Compatibility>\n" +
"   <w:BreakWrappedTables/>\n" +
"   <w:SnapToGridInCell/>\n" +
"   <w:WrapTextWithPunct/>\n" +
"   <w:UseAsianBreakRules/>\n" +
"   <w:DontGrowAutofit/>\n" +
"   <w:SplitPgBreakAndParaMark/>\n" +
"   <w:EnableOpenTypeKerning/>\n" +
"   <w:DontFlipMirrorIndents/>\n" +
"   <w:OverrideTableStyleHps/>\n" +
"  </w:Compatibility>\n" +
"  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\n" +
"  <m:mathPr>\n" +
"   <m:mathFont m:val=\"Cambria Math\"/>\n" +
"   <m:brkBin m:val=\"before\"/>\n" +
"   <m:brkBinSub m:val=\"&#45;-\"/>\n" +
"   <m:smallFrac m:val=\"off\"/>\n" +
"   <m:dispDef/>\n" +
"   <m:lMargin m:val=\"0\"/>\n" +
"   <m:rMargin m:val=\"0\"/>\n" +
"   <m:defJc m:val=\"centerGroup\"/>\n" +
"   <m:wrapIndent m:val=\"1440\"/>\n" +
"   <m:intLim m:val=\"subSup\"/>\n" +
"   <m:naryLim m:val=\"undOvr\"/>\n" +
"  </m:mathPr></w:WordDocument>\n" +
"</xml><![endif]--><!--[if gte mso 9]><xml>\n" +
" <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\n" +
"  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\n" +
"  LatentStyleCount=\"371\">\n" +
"  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index 4\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index 5\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index 6\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index 7\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index 8\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index 9\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Normal Indent\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"footnote text\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"annotation text\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"header\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"footer\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"index heading\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"table of figures\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"envelope address\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"envelope return\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"footnote reference\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"annotation reference\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"line number\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"page number\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"endnote reference\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"endnote text\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"table of authorities\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"macro\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"toa heading\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Bullet\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Number\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List 4\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List 5\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Bullet 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Bullet 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Bullet 4\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Bullet 5\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Number 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Number 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Number 4\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Number 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Closing\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Signature\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Body Text\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Body Text Indent\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Continue\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Continue 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Continue 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Continue 4\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"List Continue 5\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Message Header\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Salutation\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Date\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Body Text First Indent\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Body Text First Indent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Note Heading\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Body Text 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Body Text 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Body Text Indent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Body Text Indent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Block Text\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Hyperlink\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"FollowedHyperlink\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Document Map\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Plain Text\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"E-mail Signature\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Top of Form\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Bottom of Form\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Normal (Web)\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Acronym\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Address\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Cite\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Code\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Definition\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Keyboard\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Preformatted\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Sample\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Typewriter\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"HTML Variable\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Normal Table\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"annotation subject\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"No List\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Outline List 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Outline List 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Outline List 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Simple 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Simple 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Simple 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Classic 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Classic 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Classic 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Classic 4\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Colorful 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Colorful 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Colorful 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Columns 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Columns 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Columns 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Columns 4\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Columns 5\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Grid 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Grid 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Grid 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Grid 4\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Grid 5\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Grid 6\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Grid 7\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Grid 8\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table List 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table List 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table List 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table List 4\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table List 5\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table List 6\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table List 7\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table List 8\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table 3D effects 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table 3D effects 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table 3D effects 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Contemporary\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Elegant\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Professional\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Subtle 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Subtle 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Web 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Web 2\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Web 3\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Balloon Text\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\n" +
"   Name=\"Table Theme\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\n" +
"   Name=\"List Paragraph\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\n" +
"   Name=\"Intense Quote\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\n" +
"   Name=\"Subtle Emphasis\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\n" +
"   Name=\"Intense Emphasis\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\n" +
"   Name=\"Subtle Reference\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\n" +
"   Name=\"Intense Reference\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\n" +
"   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"Grid Table 1 Light Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"Grid Table 6 Colorful Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"Grid Table 7 Colorful Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"Grid Table 1 Light Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"Grid Table 6 Colorful Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"Grid Table 7 Colorful Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"Grid Table 1 Light Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"Grid Table 6 Colorful Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"Grid Table 7 Colorful Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"Grid Table 1 Light Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"Grid Table 6 Colorful Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"Grid Table 7 Colorful Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"Grid Table 1 Light Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"Grid Table 6 Colorful Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"Grid Table 7 Colorful Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"Grid Table 1 Light Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"Grid Table 6 Colorful Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"Grid Table 7 Colorful Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"List Table 1 Light Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"List Table 6 Colorful Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"List Table 7 Colorful Accent 1\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"List Table 1 Light Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"List Table 6 Colorful Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"List Table 7 Colorful Accent 2\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"List Table 1 Light Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"List Table 6 Colorful Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"List Table 7 Colorful Accent 3\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"List Table 1 Light Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"List Table 6 Colorful Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"List Table 7 Colorful Accent 4\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"List Table 1 Light Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"List Table 6 Colorful Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"List Table 7 Colorful Accent 5\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"46\"\n" +
"   Name=\"List Table 1 Light Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"51\"\n" +
"   Name=\"List Table 6 Colorful Accent 6\"/>\n" +
"  <w:LsdException Locked=\"false\" Priority=\"52\"\n" +
"   Name=\"List Table 7 Colorful Accent 6\"/>\n" +
" </w:LatentStyles>\n" +
"</xml><![endif]-->\n" +
"<style>\n" +
"<!--\n" +
" /* Font Definitions */\n" +
" @font-face\n" +
"	{font-family:\"Cambria Math\";\n" +
"	panose-1:2 4 5 3 5 4 6 3 2 4;\n" +
"	mso-font-charset:0;\n" +
"	mso-generic-font-family:roman;\n" +
"	mso-font-pitch:variable;\n" +
"	mso-font-signature:-536869121 1107305727 33554432 0 415 0;}\n" +
"@font-face\n" +
"	{font-family:Calibri;\n" +
"	panose-1:2 15 5 2 2 2 4 3 2 4;\n" +
"	mso-font-charset:0;\n" +
"	mso-generic-font-family:swiss;\n" +
"	mso-font-pitch:variable;\n" +
"	mso-font-signature:-536859905 1073786111 1 0 511 0;}\n" +
"@font-face\n" +
"	{font-family:\"Trebuchet MS\";\n" +
"	panose-1:2 11 6 3 2 2 2 2 2 4;\n" +
"	mso-font-charset:0;\n" +
"	mso-generic-font-family:swiss;\n" +
"	mso-font-pitch:variable;\n" +
"	mso-font-signature:1671 0 0 0 159 0;}\n" +
" /* Style Definitions */\n" +
" p.MsoNormal, li.MsoNormal, div.MsoNormal\n" +
"	{mso-style-unhide:no;\n" +
"	mso-style-qformat:yes;\n" +
"	mso-style-parent:\"\";\n" +
"	margin-top:0cm;\n" +
"	margin-right:0cm;\n" +
"	margin-bottom:8.0pt;\n" +
"	margin-left:0cm;\n" +
"	line-height:106%;\n" +
"	mso-pagination:widow-orphan;\n" +
"	font-size:11.0pt;\n" +
"	font-family:\"Calibri\",sans-serif;\n" +
"	mso-ascii-font-family:Calibri;\n" +
"	mso-ascii-theme-font:minor-latin;\n" +
"	mso-fareast-font-family:Calibri;\n" +
"	mso-fareast-theme-font:minor-latin;\n" +
"	mso-hansi-font-family:Calibri;\n" +
"	mso-hansi-theme-font:minor-latin;\n" +
"	mso-bidi-font-family:\"Times New Roman\";\n" +
"	mso-bidi-theme-font:minor-bidi;\n" +
"	mso-fareast-language:EN-US;}\n" +
"a:link, span.MsoHyperlink\n" +
"	{mso-style-priority:99;\n" +
"	color:blue;\n" +
"	text-decoration:underline;\n" +
"	text-underline:single;}\n" +
"a:visited, span.MsoHyperlinkFollowed\n" +
"	{mso-style-noshow:yes;\n" +
"	mso-style-priority:99;\n" +
"	color:#954F72;\n" +
"	mso-themecolor:followedhyperlink;\n" +
"	text-decoration:underline;\n" +
"	text-underline:single;}\n" +
"p.msonormal0, li.msonormal0, div.msonormal0\n" +
"	{mso-style-name:msonormal;\n" +
"	mso-style-unhide:no;\n" +
"	mso-margin-top-alt:auto;\n" +
"	margin-right:0cm;\n" +
"	mso-margin-bottom-alt:auto;\n" +
"	margin-left:0cm;\n" +
"	mso-pagination:widow-orphan;\n" +
"	font-size:12.0pt;\n" +
"	font-family:\"Times New Roman\",serif;\n" +
"	mso-fareast-font-family:\"Times New Roman\";\n" +
"	mso-fareast-theme-font:minor-fareast;}\n" +
"span.SpellE\n" +
"	{mso-style-name:\"\";\n" +
"	mso-spl-e:yes;}\n" +
".MsoChpDefault\n" +
"	{mso-style-type:export-only;\n" +
"	mso-default-props:yes;\n" +
"	font-size:10.0pt;\n" +
"	mso-ansi-font-size:10.0pt;\n" +
"	mso-bidi-font-size:10.0pt;\n" +
"	font-family:\"Calibri\",sans-serif;\n" +
"	mso-ascii-font-family:Calibri;\n" +
"	mso-ascii-theme-font:minor-latin;\n" +
"	mso-fareast-font-family:Calibri;\n" +
"	mso-fareast-theme-font:minor-latin;\n" +
"	mso-hansi-font-family:Calibri;\n" +
"	mso-hansi-theme-font:minor-latin;\n" +
"	mso-bidi-font-family:\"Times New Roman\";\n" +
"	mso-bidi-theme-font:minor-bidi;\n" +
"	mso-fareast-language:EN-US;}\n" +
"@page WordSection1\n" +
"	{size:792.0pt 612.0pt;\n" +
"	mso-page-orientation:landscape;\n" +
"	margin:3.0cm 70.85pt 3.0cm 70.85pt;\n" +
"	mso-header-margin:35.4pt;\n" +
"	mso-footer-margin:35.4pt;\n" +
"	mso-paper-source:0;}\n" +
"div.WordSection1\n" +
"	{page:WordSection1;}\n" +
"-->\n" +
"</style>\n" +
"<!--[if gte mso 10]>\n" +
"<style>\n" +
" /* Style Definitions */\n" +
" table.MsoNormalTable\n" +
"	{mso-style-name:\"Tabla normal\";\n" +
"	mso-tstyle-rowband-size:0;\n" +
"	mso-tstyle-colband-size:0;\n" +
"	mso-style-noshow:yes;\n" +
"	mso-style-priority:99;\n" +
"	mso-style-parent:\"\";\n" +
"	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\n" +
"	mso-para-margin:0cm;\n" +
"	mso-para-margin-bottom:.0001pt;\n" +
"	mso-pagination:widow-orphan;\n" +
"	font-size:10.0pt;\n" +
"	font-family:\"Calibri\",sans-serif;\n" +
"	mso-ascii-font-family:Calibri;\n" +
"	mso-ascii-theme-font:minor-latin;\n" +
"	mso-hansi-font-family:Calibri;\n" +
"	mso-hansi-theme-font:minor-latin;\n" +
"	mso-bidi-font-family:\"Times New Roman\";\n" +
"	mso-bidi-theme-font:minor-bidi;\n" +
"	mso-fareast-language:EN-US;}\n" +
"</style>\n" +
"<![endif]--><!--[if gte mso 9]><xml>\n" +
" <o:shapedefaults v:ext=\"edit\" spidmax=\"1026\"/>\n" +
"</xml><![endif]--><!--[if gte mso 9]><xml>\n" +
" <o:shapelayout v:ext=\"edit\">\n" +
"  <o:idmap v:ext=\"edit\" data=\"1\"/>\n" +
" </o:shapelayout></xml><![endif]-->\n" +
"</head>\n" +
"\n" +
"<body lang=ES-CO link=blue vlink=\"#954F72\" style='tab-interval:35.4pt'>\n" +
"\n" +
"<div class=WordSection1>\n" +
"\n" +
"<div align=center>\n" +
"\n" +
"<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=813\n" +
" style='width:487.5pt;mso-cellspacing:0cm;mso-yfti-tbllook:1184;mso-padding-alt:\n" +
" 0cm 0cm 0cm 0cm'>\n" +
" <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>\n" +
"  <td style='padding:1.5pt 1.5pt 1.5pt 1.5pt'>\n" +
"  <div align=center>\n" +
"  <table class=MsoNormalTable border=0 cellspacing=1 cellpadding=0 width=813\n" +
"   style='width:487.5pt;mso-cellspacing:.6pt;mso-yfti-tbllook:1184;mso-padding-alt:\n" +
"   0cm 0cm 0cm 0cm'>\n" +
"   <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>\n" +
"    <td style='background:white;padding:0cm 0cm 0cm 0cm'>\n" +
"    <div align=center>\n" +
"    <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0\n" +
"     width=\"100%\" style='width:100.0%;mso-cellspacing:0cm;mso-yfti-tbllook:\n" +
"     1184;mso-padding-alt:0cm 0cm 0cm 0cm'>\n" +
"     <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>\n" +
"      <td valign=top style='padding:0cm 0cm 0cm 0cm'></td>\n" +
"     </tr>\n" +
"     <tr style='mso-yfti-irow:1'>\n" +
"      <td valign=top style='padding:0cm 0cm 0cm 0cm'>\n" +
"      <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0\n" +
"       align=left width=\"100%\" style='width:100.0%;mso-cellspacing:0cm;\n" +
"       mso-yfti-tbllook:1184;mso-table-lspace:1.8pt;mso-table-rspace:1.8pt;\n" +
"       mso-table-bspace:1.7pt;margin-bottom:-.1pt;mso-table-anchor-vertical:\n" +
"       paragraph;mso-table-anchor-horizontal:column;mso-table-left:left;\n" +
"       mso-padding-alt:0cm 0cm 0cm 0cm'>\n" +
"       <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:49.65pt'>\n" +
"        <td width=\"5%\" rowspan=2 valign=top style='width:5.0%;padding:0cm 0cm 0cm 0cm;\n" +
"        height:49.65pt'>\n" +
"        <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;\n" +
"        mso-line-height-alt:11.65pt'><span style='font-size:12.0pt;font-family:\n" +
"        \"Times New Roman\",serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"        <td style='padding:0cm 0cm 0cm 0cm;height:49.65pt'>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:\n" +
"        center;mso-line-height-alt:11.65pt'><span style='font-size:16.5pt;\n" +
"        font-family:\"Trebuchet MS\",sans-serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-bidi-font-family:Calibri;color:#594C94;mso-fareast-language:ES-CO'>El\n" +
"        2019 viene con nuevos retos<br>\n" +
"        y la Escuela te acompaña a lograrlos.</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"        <td width=\"5%\" rowspan=2 valign=top style='width:5.0%;padding:0cm 0cm 0cm 0cm;\n" +
"        height:49.65pt'>\n" +
"        <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;\n" +
"        mso-line-height-alt:11.65pt'><span style='font-size:12.0pt;font-family:\n" +
"        \"Times New Roman\",serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"       </tr>\n" +
"       <tr style='mso-yfti-irow:1;height:91.45pt'>\n" +
"        <td width=\"79%\" style='width:79.0%;padding:0cm 0cm 0cm 0cm;height:91.45pt'>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:\n" +
"        center;line-height:11.65pt'><span style='font-size:10.0pt;font-family:\n" +
"        \"Trebuchet MS\",sans-serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'>Gracias por\n" +
"        asistir al Campus Day Escuela, esperamos que hayas disfrutado todo lo\n" +
"        que preparamos exclusivamente para ti en nuestro campus universitario.</span><span\n" +
"        style='mso-ascii-font-family:Calibri;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:\n" +
"        ES-CO'><o:p></o:p></span></p>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:\n" +
"        center;line-height:11.65pt'><span style='font-size:10.0pt;font-family:\n" +
"        \"Trebuchet MS\",sans-serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'>En la Escuela estamos\n" +
"        felices de que empieces a luchar por lo que quieres y nos encantaría\n" +
"        acompañarte en este sueño que próximamente se hará realidad.</span><span\n" +
"        style='mso-ascii-font-family:Calibri;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:\n" +
"        ES-CO'><o:p></o:p></span></p>\n" +
"        <div align=center>\n" +
"        <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0\n" +
"         width=\"100%\" style='width:100.0%;mso-cellspacing:0cm;mso-yfti-tbllook:\n" +
"         1184;mso-padding-alt:0cm 0cm 0cm 0cm'>\n" +
"         <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>\n" +
"          <td style='padding:0cm 0cm 0cm 0cm'>\n" +
"          <div align=center>\n" +
"          <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0\n" +
"           width=\"100%\" style='width:100.0%;mso-cellspacing:0cm;mso-yfti-tbllook:\n" +
"           1184;mso-padding-alt:0cm 0cm 0cm 0cm'>\n" +
"           <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>\n" +
"            <td style='padding:0cm 0cm 0cm 0cm'>\n" +
"            <p class=MsoNormal align=center style='margin-bottom:0cm;\n" +
"            margin-bottom:.0001pt;text-align:center;line-height:11.65pt'><span\n" +
"            style='font-size:10.0pt;font-family:\"Trebuchet MS\",sans-serif;\n" +
"            mso-fareast-font-family:\"Times New Roman\";mso-bidi-font-family:\n" +
"            Calibri;mso-fareast-language:ES-CO'>Recuerda que tu inscripción fue\n" +
"            gratis por haber asistido al Campus Day Escuela. Para que puedas\n" +
"            continuar con tu proceso de Admisión y diligenciar tu formulario,\n" +
"            te recordamos tu Número de Referencia en el asunto de este correo.</span><span\n" +
"            style='mso-ascii-font-family:Calibri;mso-fareast-font-family:\"Times New Roman\";\n" +
"            mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;\n" +
"            mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"            </td>\n" +
"           </tr>\n" +
"           <tr style='mso-yfti-irow:1;mso-yfti-lastrow:yes'>\n" +
"            <td style='padding:0cm 0cm 0cm 0cm'></td>\n" +
"           </tr>\n" +
"          </table>\n" +
"          </div>\n" +
"          </td>\n" +
"         </tr>\n" +
"         <tr style='mso-yfti-irow:1;mso-yfti-lastrow:yes'>\n" +
"          <td style='padding:0cm 0cm 0cm 0cm'></td>\n" +
"         </tr>\n" +
"        </table>\n" +
"        </div>\n" +
"        </td>\n" +
"       </tr>\n" +
"       <tr style='mso-yfti-irow:2'>\n" +
"        <td valign=top style='padding:0cm 0cm 0cm 0cm'>\n" +
"        <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;\n" +
"        mso-line-height-alt:11.65pt'><span style='font-size:12.0pt;font-family:\n" +
"        \"Times New Roman\",serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"        <td valign=top style='padding:0cm 0cm 0cm 0cm'>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:\n" +
"        .0001pt;text-align:center;line-height:11.65pt'><span style='font-size:\n" +
"        10.0pt;font-family:\"Trebuchet MS\",sans-serif;mso-fareast-font-family:\n" +
"        \"Times New Roman\";mso-bidi-font-family:Calibri;mso-fareast-language:\n" +
"        ES-CO'>Continúa con tu proceso ingresando <a\n" +
"        href=\"https://admisiones.escuelaing.edu.co/inscripcioneslinea/SolicitudAdm?tipoest=N\"><span\n" +
"        style='mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;\n" +
"        mso-bidi-font-family:\"Times New Roman\";mso-bidi-theme-font:minor-bidi;\n" +
"        color:windowtext;text-decoration:none;text-underline:none'>aquí</span></a><o:p></o:p></span></p>\n" +
"        </td>\n" +
"        <td valign=top style='padding:0cm 0cm 0cm 0cm'>\n" +
"        <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;\n" +
"        mso-line-height-alt:11.65pt'><span style='font-size:12.0pt;font-family:\n" +
"        \"Times New Roman\",serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"       </tr>\n" +
"       <tr style='mso-yfti-irow:3'>\n" +
"        <td valign=top style='padding:0cm 0cm 0cm 0cm'>\n" +
"        <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;\n" +
"        mso-line-height-alt:11.65pt'><span style='font-size:12.0pt;font-family:\n" +
"        \"Times New Roman\",serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"        <td valign=top style='padding:0cm 0cm 0cm 0cm'></td>\n" +
"        <td valign=top style='padding:0cm 0cm 0cm 0cm'>\n" +
"        <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;\n" +
"        mso-line-height-alt:11.65pt'><span style='font-size:12.0pt;font-family:\n" +
"        \"Times New Roman\",serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"       </tr>\n" +
"       <tr style='mso-yfti-irow:4;mso-yfti-lastrow:yes'>\n" +
"        <td valign=top style='padding:0cm 0cm 0cm 0cm'></td>\n" +
"        <td valign=top style='padding:0cm 0cm 0cm 0cm'>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:\n" +
"        .0001pt;text-align:center;mso-line-height-alt:11.65pt'><b><span\n" +
"        lang=ES style='font-size:12.0pt;font-family:\"Times New Roman\",serif;\n" +
"        mso-fareast-font-family:\"Times New Roman\";mso-ansi-language:ES;\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span></b><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:\n" +
"        .0001pt;text-align:center;line-height:11.65pt'><b><span\n" +
"        style='font-size:11.5pt;font-family:\"Trebuchet MS\",sans-serif;\n" +
"        mso-fareast-font-family:\"Times New Roman\";mso-bidi-font-family:Calibri;\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span></b><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:\n" +
"        center;mso-line-height-alt:11.65pt'><b><span style='font-size:14.0pt;\n" +
"        font-family:\"Trebuchet MS\",sans-serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-bidi-font-family:Calibri;color:#594C94;mso-fareast-language:ES-CO'>Bienvenido\n" +
"        a la Escuela Colombiana de Ingeniería Julio Garavito</span></b><span\n" +
"        style='mso-ascii-font-family:Calibri;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:\n" +
"        ES-CO'><o:p></o:p></span></p>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:\n" +
"        .0001pt;text-align:center;line-height:11.65pt'><b><span\n" +
"        style='font-size:11.5pt;font-family:\"Trebuchet MS\",sans-serif;\n" +
"        mso-fareast-font-family:\"Times New Roman\";mso-bidi-font-family:Calibri;\n" +
"        mso-fareast-language:ES-CO'>La universidad que impulsa tus retos</span></b><span\n" +
"        style='mso-ascii-font-family:Calibri;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:\n" +
"        ES-CO'><o:p></o:p></span></p>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:\n" +
"        .0001pt;text-align:center;line-height:11.65pt'><b><span\n" +
"        style='font-size:11.5pt;font-family:\"Trebuchet MS\",sans-serif;\n" +
"        mso-fareast-font-family:\"Times New Roman\";mso-bidi-font-family:Calibri;\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span></b><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"        <td valign=top style='padding:0cm 0cm 0cm 0cm'>\n" +
"        <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;\n" +
"        mso-line-height-alt:11.65pt'><span style='font-size:12.0pt;font-family:\n" +
"        \"Times New Roman\",serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"       </tr>\n" +
"      </table>\n" +
"      </td>\n" +
"     </tr>\n" +
"     <tr style='mso-yfti-irow:2;mso-yfti-lastrow:yes'>\n" +
"      <td valign=top style='padding:0cm 0cm 0cm 0cm'>\n" +
"      <table class=MsoNormalTable border=0 cellspacing=1 cellpadding=0\n" +
"       width=\"100%\" style='width:100.0%;mso-cellspacing:.6pt;mso-yfti-tbllook:\n" +
"       1184;mso-padding-alt:0cm 0cm 0cm 0cm'>\n" +
"       <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>\n" +
"        <td width=\"50%\" style='width:50.0%;background:#F0F0F0;padding:7.5pt 7.5pt 7.5pt 7.5pt'>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:\n" +
"        .0001pt;text-align:center;line-height:11.65pt'><span style='font-size:\n" +
"        8.5pt;font-family:\"Trebuchet MS\",sans-serif;mso-fareast-font-family:\n" +
"        \"Times New Roman\";mso-bidi-font-family:Calibri;color:#888888;\n" +
"        mso-fareast-language:ES-CO'>Personería Jurídica 086 de enero 19 de\n" +
"        1973.<br>\n" +
"        Acreditación institucional de alta calidad.<br>\n" +
"        Res. 20273 del 27 de noviembre de 2014.&nbsp;<br>\n" +
"        (Vigencia 4 años).</span><span style='font-size:12.0pt;font-family:\n" +
"        \"Times New Roman\",serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span><span style='font-size:8.5pt;\n" +
"        font-family:\"Trebuchet MS\",sans-serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-bidi-font-family:Calibri;color:#868686;mso-fareast-language:ES-CO'>Vigilada&nbsp;<span\n" +
"        class=SpellE>Mineducación</span>.</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"        <td width=\"50%\" style='width:50.0%;background:#F0F0F0;padding:7.5pt 7.5pt 7.5pt 7.5pt'>\n" +
"        <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:\n" +
"        .0001pt;text-align:center;line-height:11.65pt'><b><span\n" +
"        style='font-size:9.0pt;font-family:\"Trebuchet MS\",sans-serif;\n" +
"        mso-fareast-font-family:\"Times New Roman\";mso-bidi-font-family:Calibri;\n" +
"        color:#333333;mso-fareast-language:ES-CO'>Escuela Colombiana de\n" +
"        Ingeniería Julio Garavito<br>\n" +
"        </span></b><span style='font-size:9.0pt;font-family:\"Trebuchet MS\",sans-serif;\n" +
"        mso-fareast-font-family:\"Times New Roman\";mso-bidi-font-family:Calibri;\n" +
"        color:#333333;mso-fareast-language:ES-CO'>AK.45 No.205-59 (Autopista\n" +
"        Norte)<br>\n" +
"        <span class=SpellE><i>Contact</i></span><i>&nbsp;Center</i>: 57(1) 668\n" +
"        3600&nbsp;<br>\n" +
"        Línea Nacional Gratuita: 018000112668<br>\n" +
"        <a href=\"http://www.escuelaing.edu.co\"><span style='color:#954F72'>www.escuelaing.edu.co</span></a><br>\n" +
"        </span><span style='font-size:9.0pt;font-family:\"Trebuchet MS\",sans-serif;\n" +
"        mso-fareast-font-family:\"Times New Roman\";mso-bidi-font-family:Calibri;\n" +
"        color:#666666;mso-fareast-language:ES-CO'>Bogotá - Colombia</span><span\n" +
"        style='mso-ascii-font-family:Calibri;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:\n" +
"        ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"       </tr>\n" +
"      </table>\n" +
"      <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;\n" +
"      line-height:normal'><span style='font-size:12.0pt;font-family:\"Times New Roman\",serif;\n" +
"      mso-fareast-font-family:\"Times New Roman\";display:none;mso-hide:all;\n" +
"      mso-fareast-language:ES-CO'><o:p>&nbsp;</o:p></span></p>\n" +
"      <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0\n" +
"       width=\"100%\" style='width:100.0%;mso-cellspacing:0cm;mso-yfti-tbllook:\n" +
"       1184;mso-padding-alt:0cm 0cm 0cm 0cm'>\n" +
"       <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>\n" +
"        <td style='background:#76D11E;padding:0cm 0cm 0cm 0cm'>\n" +
"        <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;\n" +
"        mso-line-height-alt:11.65pt'><span style='font-size:12.0pt;font-family:\n" +
"        \"Times New Roman\",serif;mso-fareast-font-family:\"Times New Roman\";\n" +
"        mso-fareast-language:ES-CO'>&nbsp;</span><span style='mso-ascii-font-family:\n" +
"        Calibri;mso-fareast-font-family:\"Times New Roman\";mso-hansi-font-family:\n" +
"        Calibri;mso-bidi-font-family:Calibri;mso-fareast-language:ES-CO'><o:p></o:p></span></p>\n" +
"        </td>\n" +
"       </tr>\n" +
"      </table>\n" +
"      <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt'><o:p></o:p></p>\n" +
"      </td>\n" +
"     </tr>\n" +
"    </table>\n" +
"    </div>\n" +
"    </td>\n" +
"   </tr>\n" +
"  </table>\n" +
"  </div>\n" +
"  </td>\n" +
" </tr>\n" +
"</table>\n" +
"\n" +
"</div>\n" +
"\n" +
"<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:\n" +
"normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:\n" +
"\"Times New Roman\";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;\n" +
"color:black;mso-fareast-language:ES-CO'><o:p>&nbsp;</o:p></span></p>\n" +
"\n" +
"</div>\n" +
"\n" +
"</body>\n" +
"\n" +
"</html>";
    }
}
