function  startDetection(camName, rgbImage,signedUser,token)

   
p1 = detection(camName, rgbImage,signedUser);

    if p1 > 0
         [detectedArea, areaVolume] = getAreaTh(rgbImage, p1);
          areaVolume
            

         if detectedArea == 0
         
            sendTelemetry(camName, 0,token);
         else
             
            sendTelemetry(camName, areaVolume,token);
            
         end
   
    else
        CTime = datestr(now, 30);
            logLoc = sprintf('Cameras/%s/log.txt',camName);
            fileID = fopen(logLoc,'at');
            fprintf(fileID,'\n %s', CTime);
            fprintf(fileID,' %d ', 0);
            sendTelemetry(camName, 0,token);
        
    end

end
