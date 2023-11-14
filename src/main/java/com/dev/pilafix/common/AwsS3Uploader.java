package com.dev.pilafix.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

//@Component
public class AwsS3Uploader {
	
//		
//	  @SuppressWarnings({ "unused", "deprecation" })
//	  private final AmazonS3Client amazonS3Client = new AmazonS3Client();
//
//	    @Value("${cloud.aws.s3.bucket}")
//	    public String bucket;
//
//	    public String upload(MultipartFile multipartFile, String dirName) throws IOException {
//	        File uploadFile = convert(multipartFile)        // �뙆�씪 �깮�꽦
//	                .orElseThrow(() -> new IllegalArgumentException("MultipartFile -> File convert fail"));
//
//	        return upload(uploadFile, dirName);
//	    }
//
//	    private String upload(File uploadFile, String dirName) {
//	        String fileName = dirName + "/" + UUID.randomUUID() + uploadFile.getName();
//	        String uploadImageUrl = putS3(uploadFile, fileName);    // s3濡� �뾽濡쒕뱶
//	        removeNewFile(uploadFile);
//	        return uploadImageUrl;
//	    }
//
//	    // 1. 濡쒖뺄�뿉 �뙆�씪�깮�꽦
//	    private Optional<File> convert(MultipartFile file) throws IOException {
//	        File convertFile = new File(file.getOriginalFilename());
//	        if (convertFile.createNewFile()) {
//	            try (FileOutputStream fos = new FileOutputStream(convertFile)) {
//	                fos.write(file.getBytes());
//	            }
//	            return Optional.of(convertFile);
//	        }
//
//	        return Optional.empty();
//	    }
//
//	    // 2. S3�뿉 �뙆�씪�뾽濡쒕뱶
//	    private String putS3(File uploadFile, String fileName) {
//	        amazonS3Client.putObject(new PutObjectRequest(bucket, fileName, uploadFile).withCannedAcl(CannedAccessControlList.PublicRead));
////	        log.info("File Upload : " + fileName);
//	        return amazonS3Client.getUrl(bucket, fileName).toString();
//	    }
//
//	    // 3. 濡쒖뺄�뿉 �깮�꽦�맂 �뙆�씪�궘�젣
//	    private void removeNewFile(File targetFile) {
//	        if (targetFile.delete()) {
////	            log.info("File delete success");
//	            return;
//	        }
////	        log.info("File delete fail");
//	    }
//
//
//	    public void delete(String fileName) {
////	        log.info("File Delete : " + fileName);
//	        amazonS3Client.deleteObject(bucket, fileName);
//	    }
//	

}
