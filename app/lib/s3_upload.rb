class S3Upload
    def self.s3_upload(png_names,data_names)
        if Rails.env.development?
            s3 = Aws::S3::Client.new(
                :region => 'ap-northeast-1',
                :access_key_id => Rails.application.credentials.aws[:access_key_id],
                :secret_access_key => Rails.application.credentials.aws[:secret_access_key],
            )
        # elsif Rails.env.test?
        #     テスト環境のテキスト
        elsif Rails.env.production?
            s3 = Aws::S3::Client.new(
                :region => 'ap-northeast-1',
                :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
            )
        end
        # puts Rails.application.credentials.aws[:access_key_id]
        puts "s3 client get"
        #upload photo-image
        #satelight-------------------
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
            # resp = s3.list_objects_v2(bucket: "satelights")
            # resp.contents.each do |obj|
            # puts obj.key
            # end
        end #satelight-------------------
        #datas-------------------
        data_names.each do |data|
            # p "tmp/#{png}"
            # p "#{Dir.pwd}/tmp/#{png}"
            # exit
            flname= "#{data}.png"
            s3.put_object(
                :bucket => "satelights",
                :key => "#{flname}",
                # :public_read => true ,
                :body => File.open("#{Dir.pwd}/tmp/#{flname}")
            )
            # Check the file exists
            # resp = s3.list_objects_v2(bucket: "satelights")
            # resp.contents.each do |obj|
            # puts obj.key
            # end
        end #satelight-------------------
        #model書き込み
    end

end
