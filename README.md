# automated-video-transcription
  This code uses ```AssemblyAI Speech-to-Text API``` to get transcription of a single or multiple videos and generate texts into a newly created  ```.txt``` file.

### Installation
  Before cloning this reposity, check the following on your development environment.
   1. Any version of ```Ruby``` not later than 2.5.
   2. An [AssemblyAI](https://app.assemblyai.com/login/) Account.
      <br><b>NOTE:</b> There is free trial to test their end points and also paid version to get the best of the <b>Speech-to-Text API</b>. 
     
  Clone this repository to your local machine using the command.
    
      git clone https://github.com/niconisaw/automated-video-transcription 
      
#### Modification of ```API-Key``` 
  <b>API-Key</b> is auto - generated once you created your AssemblyAI account, regardless if its for free trial or already paid services. 
  <br>Put it as the ```value``` of the ```key``` titled ```authorization```.
  <br> The following methods inside the ```class Dictation``` will be requiring you to provide that API-Key
  1. ```upload_to_cloud```
  2. ``` transcribe_cloud_file```
  3. ```get_transcripted_file```

    'authorization'     => 'YOUR-API-TOKEN'

#### Modification of File Paths 
  There are exactly four(4) lines of codes where you should changed the file path. 
  <br> Your new file path should be at a directory of your local machine where you've cloned this repository. 
  
    Dir.foreach('/Users/laboteam/Documents/automate_video_workflow/videos') do | file |
    
    Dir.foreach('/Users/laboteam/Documents/automate_video_workflow/audios') do | audio |
    
    video_to_convert = "/Users/laboteam/Documents/automate_video_workflow/videos/#{video_file}"
     
    request.body_stream = File.open("/Users/laboteam/Documents/automate_video_workflow/audios/#{audio_file}")
    
   FIND these 4 specific line of codes in the file ```video_transcription.rb``` and change the following <br>
      1. **laboteam** -> change it with your PC name. <br>
      2. **Documents** -> change it with your directory (i.e. Downloads, Documents, Desktop, etc) where you cloned this repository. 
    
### Usage
  Once set up is done, run the command 
      
        ruby video_dictation.rb 
   
  But, first, make sure you have video files in the videos folder. 
    
   
  
