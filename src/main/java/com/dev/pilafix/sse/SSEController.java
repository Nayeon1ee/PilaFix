package com.dev.pilafix.sse;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.CompletableFuture;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.dev.pilafix.common.notice.NotificationService;
import com.fasterxml.jackson.annotation.JsonSubTypes.Type;

@RestController
@RequestMapping("/sse")
public class SSEController {
	
	@Autowired
	private NotificationService service;
	
    @GetMapping(value = "/stream.do", produces = "text/event-stream")
    public SseEmitter stream(@RequestParam("csMemberCode") int csMemberCode) {
        SseEmitter emitter = new SseEmitter();
        // 비동기 작업을 통해 데이터 전송
        asyncProcessToGenerateEvents(emitter, csMemberCode);
        return emitter;
    }
	
	/**
	 * 비동기로 알림 이벤트 설정 
     * SSE 연결을 통해 클라이언트에 전송 
     * 
	 * @param emitter SSE 연결을 나타내는 SseEmitter 객체 
	 * @param csMemberCode 로그인한 사용자 
	 */
    private void asyncProcessToGenerateEvents(SseEmitter emitter, int csMemberCode) {
        // ScheduledExecutorService를 사용하여 주기적으로 알림을 가져옴 
//        if (csMemberCode!=0) {
//            ScheduledExecutorService executorService = Executors.newScheduledThreadPool(1);
//            ScheduledFuture<?> scheduledFuture = executorService.scheduleAtFixedRate(() -> {
//                try {
//                	// 알림 개수를 가져옴(비동기)
//                    CompletableFuture<Integer> responseFuture = service.getUnReadNotificationCountAsync(csMemberCode);
//                    
//                    // 비동기 작업 완료까지 기다렸다가 결과 가져옴 
//                    Integer response = responseFuture.get();
//                    
//                    // SSE 연결을 통해 클라이언트에게 알림 이벤트 전송 
//                    emitter.send(SseEmitter.event().data(String.valueOf(response)));
//                } catch (Exception e) {
//                    emitter.completeWithError(e);
//                }
//            }, 0, 1, TimeUnit.SECONDS);
//
//            // SSE 연결이 종료되면 ScheduledExecutorService도 중지되도록 설정
//            emitter.onCompletion(() -> scheduledFuture.cancel(true));
//        } else {
//            // csMemberCode가 유효하지 않은 경우에 대한 처리
//            emitter.complete();
//        }
        
    }
    

    
    
	
	
//    @GetMapping
//    public void sse(final HttpServletResponse response) throws IOException, InterruptedException{
//        response.setContentType("text/event-stream");
//        response.setCharacterEncoding("UTF-8");
//
//        Writer writer = response.getWriter();
//
//        for(int i = 0; i<20; i++){
//            writer.write("data : "+System.currentTimeMillis()+"\n\n");
//            writer.flush();
//            Thread.sleep(1000);
//        }
//
//        writer.close();
//    }
    
    //private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
    // /**
    //  * 특정 클라이언트에게 SSE 연결 생성 
    //  * 클라이언트마다 고유한 클라이언트 ID를 사용 
    //  * 클라이언트 ID를 경로 변수로 받아와서 SSEEmitter를 생성하고 관리함 
    //  * @param clientId
    //  * @return SSEEmitter
    //  */
	// @GetMapping(value="/stream/{clientId}", produces=MediaType.TEXT_EVENT_STREAM_VALUE)
	// public SseEmitter stream(@PathVariable String clientId) {
    //     SseEmitter emitter = new SseEmitter();
        
    //     //연결 완료, 오류, 타임아웃 이벤트 핸들러 등록 
    //     emitter.onCompletion(() -> {
    //         emitters.remove(clientId);
    //         cleanupEmitter(emitter);
    //     });
    //     emitter.onError((ex) -> {
    //         emitters.remove(clientId);
    //         cleanupEmitter(emitter);
    //     });
    //     emitter.onTimeout(() -> {
    //         emitters.remove(clientId);
    //         cleanupEmitter(emitter);
    //     });

    //     //클라이언트 ID와 SSEEmitter를 맵에 저장 
    //     emitters.put(clientId, emitter);

    //     return emitter;
	// }

    // /**
    //  * 특정 클라이언트에게 이벤트 전송 
    //  * 클라이언트 ID를 경로 변수로 받아와서 해당 클라이언트의 SSEEmitter를 찾아 이벤트 전송
    //  *   
    //  * @param clientId  클라이언트 ID
    //  * @param message 전송할 메시지 
    //  */
    // @GetMapping("/send/{clientId}")
    // public void sendEventToClient(@PathVariable String clientId, String message){
    //     SseEmitter emitter = emitters.get(clientId);

    //     if(emitter != null){
    //         try{
    //             emitter.send(SseEmitter.event().data(message));
    //         }catch (IOException e){
    //             emitter.completeWithError(e);
    //         }
    //     }
    // }

    // /**
    //  * 모든 클라이언트에게 이벤트 전송 
    //  * 현재 연결된 모든 SSEEmitter를 순회하며 이벤트 전송 
    //  * 
    //  * @param message 전송할 메시지 
    //  */
    // @GetMapping("send/all")
    // public void sendEventToAll(String message){
    //     for(SseEmitter emitter:emitters.values()){
    //         try{
    //             emitter.send(SseEmitter.event().data(message));
    //         }catch (IOException e){
    //             emitter.completeWithError(e);
    //         }
    //     }
    // }

    // /**
    //  * SSEEmitter를 정리하고 완료 처리 
    //  * 
    //  * @param emitter SSEEmitter 
    //  */
    // private void cleanupEmitter(SseEmitter emitter){
    //     try{
    //         emitter.complete();
    //     }catch(Exception e){
    //         e.getMessage();
    //     }
    // }

}
