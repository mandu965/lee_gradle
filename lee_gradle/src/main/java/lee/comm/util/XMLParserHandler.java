package lee.comm.util;

import java.util.ArrayList;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class XMLParserHandler  extends DefaultHandler {
 	private String elementName = "";
    private StringBuffer sBuffer = new StringBuffer();
    
    private ArrayList<String> tagList  = new ArrayList<String>();
    
    // XML 문서의 시작이 인식되었을 때 발생하는 이벤트를 처리
    public void startDocument() {
        //System.out.println("Start Document");
    }
    
    // XML 문서의 끝이 인식되었을 때 발생하는 이벤트를 처리
    public void endDocument() {
        //System.out.println("End Document");
    }
 
    // 엘리먼트의 시작을 인식했었을 때 발생하는 이벤트를 처리
    public void startElement(String uri, String localName, String qname, Attributes attr) { 
        elementName = qname;    //element명을 멤버 변수에 넣어 둔다.
        int attrCount=attr.getLength(); // 태그 개수
        String attrName=attr.getQName(0); // 첫번째 태그 임의 설정
        String attrValue=attr.getValue(attrName);
        /*
         * 활용 예시
        if(qname.equals("img")){
  		  int attrCount=attr.getLength(); // 태그 개수
	        for(int i=0; i<attrCount; i++)
	        {
	         String attrName=attr.getQName(i);
	         String attrValue=attr.getValue(attrName);
	         if(attrName.equals("file")){
	        	 if(attrValue.length()>9){
	        		 String file_nm = attrValue.substring(attrValue.lastIndexOf(".")-6);
     	        	tagList.add(file_nm);	 
	        	 }
	        	//System.out.println("속성값=============" + attrName+""+attrValue);	 
	         }
	        }
  	  }
	         */
      System.out.println("속성값=============" + attrName+"=="+attrValue);
      
        sBuffer.setLength(0);    // buffer 초기화
    }
 
    // 엘리먼트의 끝을 인식했었을 때 발생하는 이벤트를 처리
    public void endElement(String uri, String localName, String qname) {    
        System.out.println("End element, Name: " + qname);
    }
 
    // 각 element의 값 (인식된 문자의 각 세그먼트에 대해서 호출)
    public void characters(char[] ch, int start, int length) throws SAXException {
        String strValue = "";
 
        // element의 값을 구하기 위해서는 buffer에 인식된 각 문자를 start에서 length만큼 append한다.
        sBuffer.append(new String(ch, start, length));
        strValue = sBuffer.toString().trim();
        
        if (strValue != null && strValue.length() != 0 && !strValue.equals("\n")) {
           System.out.println("elementName: " + elementName + ", strValue: "+ strValue);
        }
    }
    
    public ArrayList getTagList() {
        return tagList;
    }
}