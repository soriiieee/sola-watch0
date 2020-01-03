require "fileutils"
require "url_check"

class GetDatas
  def self.getimage()
        FileUtils.rm(Dir.glob('tmp/*.pdf'))
        # FileUtils.rm(Dir.glob('tmp/*.jpg'))
        FileUtils.rm(Dir.glob('tmp/*.png'))
        tt1 = Time.now.ago(1.hour)
        tt2 = tt1.ago(9.hour)

        # yy1= tt1.strftime("%Y")
        # mm1= tt1.strftime("%m")
        # dd1= tt1.strftime("%d")
        # hh1= tt1.strftime("%H")

        # yy2= tt2.strftime("%Y")
        # mm2= tt2.strftime("%m")
        # dd2= tt2.strftime("%d")
        # hh2= tt2.strftime("%H")
        # mi= tt0.strftime("%M")
    #   p "get image just now"
        dir = Dir.pwd
        # exit
        # p hh2
        # p tt2
        # exit
      #高層天気図
      a200 = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupa20_00.pdf" #アジア太平洋200hPa高度・気温・風
      a300 = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupn30_00.pdf" #アジア太平洋300hPa高度・気温・風天気図
      n300 = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq35_00.pdf" #北太平洋300hPa高度・気温・風天気図(up)
      n500 = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq35_00.pdf" #北太平洋300hPa高度・気温・風天気図(down)
      n700 = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq78_00.pdf"
      n850 = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq78_00.pdf"
      vwi1 = "https://www.jma.go.jp/jp/metcht/pdf/kosou/axfe578_00.pdf" #極東850hPa気温・風、700hPa上昇流／500hPa高度・渦度天気図
      vro1 = "https://www.jma.go.jp/jp/metcht/pdf/kosou/axfe578_00.pdf" #極東850hPa気温・風、700hPa上昇流／500hPa高度・渦度天気図
      emag = "https://www.jma.go.jp/jp/metcht/pdf/kosou/axjp140_00.pdf" #emagram
      
    
      # name= File.basename(emag)
      urls = [a200,a300,n300,n500,n700,n850,vwi1,vro1,emag]
      names = ["a200","a300","n300","n500","n700","n850","vwi1","vro1","emag"]
      pdfs= [] #initialize
      pngs=[]
      flgs = []
    #   p f_urls
    #   exit
    # ---> pdf data download
      urls.each_with_index do |url,i|
        url_o = UrlCheck.new
        if url_o.url_request(url) then
            # p "get pngs"
            flg=1
            # fname= File.basename(url)
            fname = names[i]
            open(url) do |image|
                File.open("#{dir}/tmp/#{fname}", "wb") do |file|
                    file.write(image.read)
                end
            end
            pdfs.push("#{dir}/tmp/#{fname}")
            flgs.push(flg)
        else
            flg=0
            fname = "weather.jpg"
            FileUtils.cp("#{dir}/app/assets/images/#{fname}", "#{dir}/tmp/#{fname}")
            pdfs.push("#{dir}/tmp/#{fname}")
            flgs.push(flg)
        end
      end #each_with_index
    # ---> pdf data ---> png data
      pdfs.each_with_index do |pdfname, idx|
        if File.extname(pdfname) != ".jpg" then
          pngbase = File.basename(pdfname,".pdf")
          image = Magick::Image.read(pdfname)
          # if idx == 0 then image_crop = image[0].crop(43, 76, 792, 640) end
          # if idx == 1 then image_crop = image[0].crop(18, 42, 686, 469) end
          # if idx == 2 then image_crop = image[0].crop(18,544, 686, 469) end
          # if idx == 3 then image_crop = image[0].crop(20, 40, 686, 469) end
          # if idx == 4 then image_crop = image[0].crop(20,540, 686, 469) end
          # if idx == 5 then image_crop = image[0].crop(20,540, 686, 469) end
          # if idx == 6 then image_crop = image[0].crop(20,540, 686, 469) end
          # if idx == 7 then image_crop = image[0].crop(20,540, 686, 469) end
          if idx == 0 then image_crop = image[0].crop(40, 73, 799, 645) end
          if idx == 1 then image_crop = image[0].crop(40, 73, 799, 648) end
          if idx == 2 then image_crop = image[0].crop(18, 40, 689, 488) end
          if idx == 3 then image_crop = image[0].crop(18,540, 689, 488) end
          if idx == 4 then image_crop = image[0].crop(18, 40, 689, 488) end
          if idx == 5 then image_crop = image[0].crop(18,540, 689, 488) end
          if idx == 6 then image_crop = image[0].crop(40, 7, 425, 344) end
          if idx == 7 then image_crop = image[0].crop(40,355,425, 344) end
          if idx == 8 then image_crop = image[0].crop(15,48, 697, 459) end

          image_crop.write("#{dir}/tmp/#{pngbase}.png")
          pngs.push(pngbase)
        else
          pngbase= File.basename(url,".jpg")
          pngs.push(pngbase)
        end
      end
      return [pngs,flgs]
  end
end
