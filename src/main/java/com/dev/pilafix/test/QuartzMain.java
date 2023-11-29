package com.dev.pilafix.test;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;


public class QuartzMain {
	public static void main(String[] args) throws SchedulerException {
//		
//		// Job 생성 
//		// myJob이라는 식별자와 group1이라는 그룹을 부여
//		JobDetail job = JobBuilder.newJob(MyJob.class)
//				.withIdentity("myJob","group1").build();
//		
//		// Trigger 생성 및 설정 
//		// 즉시 시작하고 10초 간격으로 무한히 반복하는 스케줄을 설정
//		 Trigger trigger = TriggerBuilder.newTrigger()
//		            .withIdentity("myTrigger", "group1")
//		            .startNow()
//		            .withSchedule(SimpleScheduleBuilder.simpleSchedule()
//		                    .withIntervalInSeconds(10)
//		                    .repeatForever())
//		            .build();
//		
//		 //스케줄러 생성 및 Job, Trigger 등록 
//		 Scheduler scheduler = new StdSchedulerFactory().getScheduler();
//		 scheduler.start();
//		 scheduler.scheduleJob(job, trigger); // 앞에서 생성한 스케줄러를 등록하여 스케줄 설정 
//		 
//		 //
//		
	}
}
