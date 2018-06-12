class VimeoUploader < CarrierWave::Uploader::Base

      storage :file
   
     def store_dir
         "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
     end

     version :video, :if => :video? do
          process :encode
     end

     version :thumb do
          process thumbnail: [{format: 'jpg', quality: 8, size: 360, logger: Rails.logger}]
          def full_filename for_file
              jpg_name for_file, version_name
          end
     end

     version :medium do
           process thumbnail: [{format: 'jpg', quality: 85, size: 300, logger: Rails.logger}]
          def full_filename for_file
              jpg_name for_file, version_name
          end
     end

    def encode
        video = FFMPEG::Movie.new(@file.path)
        video_transcode = video.transcode(@file.path)
    end

    # Create different versions of your uploaded files:
    version :image,:if => :image? do
          process :resize_to_fit => [740, 300]
    end

    def jpg_name for_file, version_name
         %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.jpg}
    end

    protected
    def image?(new_file)
         new_file.content_type.include? 'image'
    end
    def video?(new_file)
        new_file.content_type.include? 'video'
    end
end
