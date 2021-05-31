require 'net/http'
require 'openssl'
require 'json'

def main 
  list_of_audios = Array.new

  Dir.foreach('/Users/laboteam/Documents/automate_video_workflow/videos') do | file |
    next if file == '.' or file == '..' or file == '.DS_Store'
      Dictation.new.convert_video_to_audio(file, "#{File.basename(file, '.mp4')}")
  end

  Dir.foreach('/Users/laboteam/Documents/automate_video_workflow/audios') do | audio |
    next if File.extname(audio) != '.wav'
      list_of_audios.push(audio)
  end 

  list_of_audios.each do | audio_file |
    audio_json = Dictation.new.upload_to_cloud(audio_file)
    upload_url = JSON.parse(audio_json)['upload_url']
    audio_url = ({'audio_url' => upload_url})

    cloud_json = Dictation.new.transcribe_cloud_file(audio_url)
    audio_id = JSON.parse(cloud_json)['id']
    
    sleep 90

    transcript = Dictation.new.get_transcripted_file(audio_id)
    transcript_texts = JSON.parse(transcript)['text']

    puts transcript_texts

    transcript_file = File.new("transcript_#{audio_id}.txt", "w")
    transcript_file.puts(transcript_texts)
    transcript_file.close
  end

end 

class Dictation

  def convert_video_to_audio(video_file, audio_title)
    video_to_convert = "/Users/laboteam/Documents/automate_video_workflow/videos/#{video_file}"
    system "ffmpeg -i #{video_to_convert} -vn ./audios/#{audio_title}.wav"
  end


  def upload_to_cloud(audio_file) 
    uri = URI('https://api.assemblyai.com/v2/upload')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(
      uri,
      'authorization'     => '9d3153efa22c4a9e95c4efbccce19160',
      'transfer-encoding' => 'chunked'
    )

    request.body_stream = File.open("/Users/laboteam/Documents/automate_video_workflow/audios/#{audio_file}")

    response = http.start do |http|
      http.request(request)
    end

    return response.read_body
  end


  def transcribe_cloud_file(audio_json)
    uri = URI('https://api.assemblyai.com/v2/transcript')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true 
    request = Net::HTTP::Post.new(
      uri,
      'authorization' => '9d3153efa22c4a9e95c4efbccce19160',
      'content-type'  => 'application/json'
    )
    request.body = (audio_json).to_json
    response = http.request(request)
    return response.read_body
  end

  def get_transcripted_file(audio_id)
    uri = URI("https://api.assemblyai.com/v2/transcript/#{audio_id}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(
      uri,
      'authorization' => '9d3153efa22c4a9e95c4efbccce19160',
      'content-type'  => 'application/json'
    )
    
    response = http.request(request)
    return response.read_body
  end

end

main 