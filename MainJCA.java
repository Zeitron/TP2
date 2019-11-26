import java.io.*;
import java.nio.*;
import java.security.*;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;


public class MainJCA{
	
	/*Função principal onde defino as opções de entrada e onde chamo as outras
	 *  funções do programa*/
	public static void main(String[] args){
		if(args.length < 2) {
			System.out.println("Error... expecting two command line args");
			System.exit(1);
		}
		
		try {
			switch(args[0]) {
			/*Sem break na linha do Hash para que ela possa mostra tambem
			 *  o conteudo do arquivo*/
			case "--hash": System.out.println("Hash Gerada:\n"+generateHash(args));
			
			case "--readfile": System.out.println("Conteudo do arquivo:\n"+
			readFile(args)); break;
			
			case "--verify": System.out.println("A Hash e o arquivos sao iguais? " +
			(String.valueOf(verifyHash(args)))); break;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/*Converto bytes hex em string hex*/
	 private static String hextoString(byte[] bytes){
	     String retorno="";  
		 for (byte b : bytes) {
	            String st = String.format("%02X", b);
	            retorno = retorno.concat(st);
	     }
	        return retorno;
	 }
	
	
	/*Reponsavel por ler o arquivo*/
	private static String readFile(String args[]){
		
		StringBuilder contentBuilder = new StringBuilder();
		
	    try (BufferedReader br = new BufferedReader(new FileReader(args[1]))){
	 
	        String sCurrentLine;
	   
	        while ((sCurrentLine = br.readLine()) != null){
	            contentBuilder.append(sCurrentLine);
	        }
	    } 
	    catch (IOException e){
	        e.printStackTrace();
	    }
	    
	    return contentBuilder.toString();
	}
	
	/*Reponsavel por gerar a Hash*/
	private static String generateHash(String args[])throws Exception{
		
		String conteudo_texto;
		
		conteudo_texto = readFile(args);
//		
//		System.out.println("Conteudo do aquivo:\n"+ conteudo_texto);
//		KeyGenerator kg = KeyGenerator.getInstance("DES");
//		
//		SecretKey sKey = kg.generateKey();
//		
//		byte[] testdata = "This is test data".getBytes();
//		
//		Cipher myCipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
//		
//		myCipher.init(Cipher.ENCRYPT_MODE, sKey);
//
//		byte[] cipherText = myCipher.doFinal(testdata);
//		
//	    System.out.println(cipherText);
				
		MessageDigest sha = MessageDigest.getInstance("SHA-256");
		
		byte[] i1 = conteudo_texto.getBytes();
		
		sha.update(i1);
		
		byte[] hash = sha.digest();
		
		String s = hextoString(hash);
		
		return s; 
		
	}
	
	/*Checa se a hash é compativel*/
	private static boolean verifyHash(String args[]) {
		try {
			return generateHash(args).equals(args[2]);			
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}

