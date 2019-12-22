class GetSatelightsImage
    def self.getimage(yy,mm,dd,hh,mi,dir)
    #   p "get image just now"

      #高層天気図
      a200hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupa20_00.pdf"
      a300hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq35_00.pdf"
      a500hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq35_00.pdf"
      a700hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq78_00.pdf"
      a850hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq78_00.pdf"



      #地上天気図
      a1013hpa_url = "https://www.data.jma.go.jp/fcd/yoho/data/wxchart/quick/#{yy}#{mm}/SPAS_COLOR_#{yy}#{mm}#{dd}0000.png"
      p a1013hpa_url

      #サテライト
      infrared_url = "https://www.jma.go.jp/jp/gms/imgs/0/infrared/1/#{yy}#{mm}#{dd}#{hh}00-00.png"
      visible_url = "https://www.jma.go.jp/jp/gms/imgs/0/visible/1/#{yy}#{mm}#{dd}#{hh}00-00.png"
      watervapor_url = "https://www.jma.go.jp/jp/gms/imgs/0/watervapor/1/#{yy}#{mm}#{dd}#{hh}00-00.png"

      #pdfファイルたちを配列にぶっ込み
      pdf_files =[a200hpa_url, a300hpa_url, a500hpa_url, a700hpa_url, a850hpa_url]
      pdf_names = ["200hpa","300hpa","500hpa","700hpa","850hpa"]

      #pngファイルたちを配列にぶっ込み
      png_files =[a1013hpa_url,infrared_url,visible_url,watervapor_url]
      png_names = ["1013hpa","infrared","visible","watervapor"]

      #pngの保存
      png_files.each_with_index do |png_file, idx|
          open(png_file) do |image|
              File.open("#{dir}/#{png_names[idx]}.png", "wb") do |file|
                  file.write(image.read)
              end
          end
      end

      #pdfの保存
      pdf_files.each_with_index do |pdf_file, idx|
          open(pdf_file) do |image|
              File.open("#{dir}/#{pdf_names[idx]}.pdf", "wb") do |file|
                  file.write(image.read)
              end
          end
      end

      #pdfからjpgへの変更

      #pdfの保存
      pdf_names.each_with_index do |file_name, idx|
          file_name = "#{dir}/#{file_name}.pdf"
          image = Magick::Image.read(file_name)
          if idx == 0 then image_crop = image[0].crop(43, 76, 792, 640) end
          if idx == 1 then image_crop = image[0].crop(18, 42, 686, 469) end
          if idx == 2 then image_crop = image[0].crop(18,544, 686, 469) end
          if idx == 3 then image_crop = image[0].crop(20, 40, 686, 469) end
          if idx == 4 then image_crop = image[0].crop(20,540, 686, 469) end

          image_crop.write("#{dir}/#{pdf_names[idx]}.png")
      end

      #200hpa
      # file_name_200 = "img_dir/#{date}/#{pdf_names[0]}.pdf"
      # image = Magick::Image.read(file_name_200)
      # image_crop = image[0].crop(43, 76, 792, 640)
      # image_crop.write("img_dir/#{date}/200hpa_crop.jpg")
    end
end
