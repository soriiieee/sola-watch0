class NowsController < ApplicationController
    def index
           #ひまわり時間はutcなので　9+1時間マイナス/そして20分更新のためif文章でurl修正を実施
        tt0 = Time.now.ago(10.hour)
        # p tt0
        # comment = Test00.new
        # p comment.getInfo()
        # exit
        ## himawari---------------
        @tt1 = Time.now.ago(1.hour).strftime("%Y-%m-%d %H:00")

        yy= tt0.strftime("%Y")
        mm= tt0.strftime("%m")
        dd= tt0.strftime("%d")
        hh= tt0.strftime("%H")
        mi= tt0.strftime("%M")

        @url="https://himawari8-dl.nict.go.jp/himawari8/img/D531106/1d/550/#{yy}/#{mm}/#{dd}/#{hh}0000_0_0.png" 
        # p @url "https://himawari8-dl.nict.go.jp/himawari8/img/D531106/1d/550/2019/12/19/140000_0_0.png"
        
        # latest images get 
        display  =  Calender.last
        @tt2 = display.created_at.since(9.hour).strftime("%Y-%m-%d %H:%M")

        #
        @url_photo1 ="https://satelights.s3-ap-northeast-1.amazonaws.com/#{display.photo1}"
        @url_photo2 ="https://satelights.s3-ap-northeast-1.amazonaws.com/#{display.photo2}"
        @url_photo3 ="https://satelights.s3-ap-northeast-1.amazonaws.com/#{display.photo3}"
        @url_photo4 ="https://satelights.s3-ap-northeast-1.amazonaws.com/#{display.photo4}"

        p @url_photo1

    end

    def getimage
        ## satelight---file get up load------------
        # datas = GetDatas.getimage()
        pngs_flgs_data = GetDatas.getimage()
        pngs_flgs = GetSatelights.getimage()
        # p pngs_flgs_data
        # exit
        # p pngs_flgs[0]
        # exit
        # s3 upload(png)
        S3Upload.s3_upload(pngs_flgs[0],pngs_flgs_data[0])

        ttstr = Time.now.ago(1.hour).strftime("%Y%m%d%H00")
        stime = Time.now
        # p ttstr
        # p png_names
        # exit
        Calender.create(
            name: ttstr,
            start_time: stime,
            photo1: pngs_flgs[0][0],
            photo2: pngs_flgs[0][1],
            photo3: pngs_flgs[0][2],
            photo4: pngs_flgs[0][3],
            data1: pngs_flgs_data[0][0]+".png",
            data2: pngs_flgs_data[0][1]+".png",
            data3: pngs_flgs_data[0][2]+".png",
            data4: pngs_flgs_data[0][3]+".png",
            data5: pngs_flgs_data[0][4]+".png",
            data6: pngs_flgs_data[0][5]+".png",
            data7: pngs_flgs_data[0][6]+".png",
            data8: pngs_flgs_data[0][7]+".png",
            data9: pngs_flgs_data[0][8]+".png"
        )
        # @message="すでに取得済みの画像を表示します"
        display  =  Calender.last
        p display.created_at
        p display
        redirect_to '/nows'

    end

end
