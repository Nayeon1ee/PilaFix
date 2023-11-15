package com.dev.pilafix.common;

import java.io.File;
import java.io.InputStream;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AwsS3 {
	
	   // Amazon-s3-sdk
	   private AmazonS3 s3Client;
	   final private String accesskey = "A";
	   final private String secretKey = "T"; // (�нǽ� �׼��� ��߱� �޾ƾ��մϴ�.)
	   private Regions clientRegion = Regions.AP_NORTHEAST_2;
	   private String bucket = "p"; // ��Ŷ ��


//	  @Value("${cloud.aws.credentials.access-key}")
//	  private String accessKey;
//	
//	  @Value("${cloud.aws.credentials.secret-key}")
//	  private String secretKey;
//	
//	  @Value("${cloud.aws.s3.bucket}")
//	  private String bucket;
//	  
//	  @Value("${cloud.aws.region.static}")
//	  private String clientRegion;
	
	
	private AwsS3() {
		createS3Client();
	}

	// singleton pattern
	static private AwsS3 instance = null;

	public static AwsS3 getInstance() {
		if (instance == null) {
			return new AwsS3();
		} else {
			return instance;
		}
	}

	// aws S3 client ����
	private void createS3Client() {

		AWSCredentials credentials = new BasicAWSCredentials(accesskey, secretKey);
		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(clientRegion).build();
	}

	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}

	public void upload(InputStream is, String key, String contentType, long contentLength, String bucket) {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(contentLength);

		uploadToS3(new PutObjectRequest(bucket, key, is, objectMetadata));
	}

	// PutObjectRequest�� Aws S3 ��Ŷ�� ���ε��� ��ü ��Ÿ �����Ϳ� ���� �����ͷ� �̷�����ִ�.
	private void uploadToS3(PutObjectRequest putObjectRequest) {

		try {
			this.s3Client.putObject(putObjectRequest);
			System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));

		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void copy(String orgKey, String copyKey) {
		try {
			// Copy ��ü ����
			CopyObjectRequest copyObjRequest = new CopyObjectRequest(this.bucket, orgKey, this.bucket, copyKey);
			// Copy
			this.s3Client.copyObject(copyObjRequest);

			System.out.println(String.format("Finish copying [%s] to [%s]", orgKey, copyKey));

		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}
	}

	public void delete(String key) {
		try {
			// Delete ��ü ����
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
			// Delete
			this.s3Client.deleteObject(deleteObjectRequest);
			System.out.println(String.format("[%s] deletion complete", key));

		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}
	}

}
