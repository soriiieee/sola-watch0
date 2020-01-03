require "fileutils"
require "url_check"

class GetSatelights
    def self.getimage()
        # FileUtils.rm(Dir.glob('tmp/*.png'))
        tt1 = Time.now.ago(1.hour)
        tt2 = tt1.ago(9.hour)

        yy1= tt1.strftime("%Y")
        mm1= tt1.strftime("%m")
        dd1= tt1.strftime("%d")
        hh1= tt1.strftime("%H")

        yy2= tt2.strftime("%Y")
        mm2= tt2.strftime("%m")
        dd2= tt2.strftime("%d")
        hh2= tt2.strftime("%H")
        # mi= tt0.strftime("%M")
    #   p "get image just now"
        dir = Dir.pwd
        # exit
        # p hh2
        # p tt2
        # exit
      #高層天気図
    #   a200hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupa20_00.pdf"
    #   a300hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq35_00.pdf"
    #   a500hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq35_00.pdf"
    #   a700hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq78_00.pdf"
    #   a850hpa_url = "https://www.jma.go.jp/jp/metcht/pdf/kosou/aupq78_00.pdf"



    #   #地上天気図
      surfa_url = "https://www.data.jma.go.jp/fcd/yoho/data/wxchart/quick/#{yy2}#{mm2}/SPAS_COLOR_#{yy2}#{mm2}#{dd2}0000.png"
    #   p a1013hpa_url
      #サテライト　　src="https://www.jma.go.jp/jp/gms/imgs/0/infrared/1/201912200020-00.png"
      infra_url = "https://www.jma.go.jp/jp/gms/imgs/0/infrared/1/#{yy1}#{mm1}#{dd1}#{hh1}00-00.png"
      visib_url = "https://www.jma.go.jp/jp/gms/imgs/0/visible/1/#{yy1}#{mm1}#{dd1}#{hh1}00-00.png"
      water_url = "https://www.jma.go.jp/jp/gms/imgs/0/watervapor/1/#{yy1}#{mm1}#{dd1}#{hh1}00-00.png"
    #   https://www.jma.go.jp/jp/gms/imgs/0/watervapor/1/201912211400-00.png
    # File.basename
      surfa_png = "SPAS_COLOR_#{yy2}#{mm2}#{dd2}0000.png"
      infra_png = "infrared_#{yy1}#{mm1}#{dd1}#{hh1}00-00.png"
      visib_png = "visible_#{yy1}#{mm1}#{dd1}#{hh1}00-00.png"
      water_png = "watervapor_#{yy1}#{mm1}#{dd1}#{hh1}00-00.png"

      f_urls = [surfa_url,infra_url,visib_url,water_url]
      f_pngs = [surfa_png,infra_png,visib_png,water_png]
      get_pngs=[]
      png_flgs = []
    #   p f_urls
    #   exit
      f_urls.each_with_index do |url,i|
        url_o = UrlCheck.new
        # p url
        # p url_o.url_request(url)
        # exit
        if url_o.url_request(url) then
            # p "get pngs"
            flg=1
            # fname= File.basename(url)
            fname = f_pngs[i]
            open(url) do |image|
                File.open("#{dir}/tmp/#{fname}", "wb") do |file|
                    file.write(image.read)
                end
            end
            get_pngs.push(fname)
            png_flgs.push(flg)
        else
            flg=0
            fname = "weather.jpg"
            FileUtils.cp("#{dir}/app/assets/images/#{fname}", "#{dir}/tmp/#{fname}")
            get_pngs.push(fname)
            png_flgs.push(flg)
        end
      end #each_with_index
      return [get_pngs,png_flgs]
    end
end
