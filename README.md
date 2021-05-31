# automated-video-transcription
  This code uses ```AssemblyAI Speech-to-Text API``` to get transcription of a single or multiple videos and generate texts into a newly created  ```.txt``` file.

### Installation
  Before cloning this reposity, check the following on your development environment:
   1. Any version of ```Ruby``` not later than 2.5.
   2. An [AssemblyAI](https://app.assemblyai.com/login/) Account.
      <br><b>NOTE:</b> There is free trial to test their end points and also paid version to get the best of the <b>Speech-to-Text API</b>. 
     
  Clone this repository to your local machine using the command:
    
      git clone https://github.com/niconisaw/automated-video-transcription 
      
#### Modification of ```API-Key``` 
  In the ```class Dictation```, 3 out of 4 methods in it will require you to provide your API-Key. 
  <br> <b>API-Key</b> is auto - generated once you created your AssemblyAI account, regardless if its free trial or already paid. 
  Put it as the value of the ```key``` titled ```authorization```
  <br>
     ```'authorization'     => 'YOUR-API-TOKEN'```
   
  
