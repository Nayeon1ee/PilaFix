package com.dev.pilafix.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

//@Configuration
public class AwsS3Config {
//    @Value("${cloud.aws.credentials.access-key}")
//    private String accessKey;
//
//    @Value("${cloud.aws.credentials.secret-key}")
//    private String secretKey;
//
//    @Value("${cloud.aws.region.static}")
//    private String region;
//
//    private AwsS3Config() {
//    	amazonS3Client();
//     }
//
//     // singleton pattern
//     static private AwsS3Config instance = null;
//
//     public static AwsS3Config getInstance() {
//        if (instance == null) {
//           return new AwsS3Config();
//        } else {
//           return instance;
//        }
//     }
//     
//     @Bean
//     public AmazonS3Client amazonS3Client() {
//         BasicAWSCredentials awsCreds = new BasicAWSCredentials(accessKey, secretKey);
//         return (AmazonS3Client) AmazonS3ClientBuilder.standard()
//                 .withRegion(region)
//                 .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
//                 .build();
//     }

}
