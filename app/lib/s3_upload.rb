class S3Upload
    def self.s3_upload(png_names)
        s3 = Aws::S3::Client.new(
            :region => 'ap-northeast-1',
            :access_key_id => Rails.application.credentials.aws[:access_key_id],
            :secret_access_key => Rails.application.credentials.aws[:secret_access_key],
        )
        # puts Rails.application.credentials.aws[:access_key_id]
        puts "s3 client get"
        #upload photo-image
        png_names.each do |png|
            # p "tmp/#{png}"
            # p "#{Dir.pwd}/tmp/#{png}"
            # exit

            s3.put_object(
                :bucket => "satelights",
                :key => "#{png}",
                # :public_read => true ,
                :body => File.open("#{Dir.pwd}/tmp/#{png}")
            )
            # Check the file exists
            resp = s3.list_objects_v2(bucket: "satelights")
            resp.contents.each do |obj|
            # puts obj.key
            end
        end
        #model書き込み
    end

end
