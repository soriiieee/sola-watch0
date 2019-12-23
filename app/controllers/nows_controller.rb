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
        @display  =  Calender.last
        @tt2 = @display.created_at.since(9.hour).strftime("%Y-%m-%d %H:%M")

    end

    def getimage
        ## satelight---file get up load------------
        pngs_flgs = GetSatelights.getimage()
        # p pngs_flgs[0]
        # exit
        # s3 upload(png)
        S3Upload.s3_upload(pngs_flgs[0])

        ttstr = Time.now.ago(1.hour).strftime("%Y%m%d%H00")
        # p ttstr
        # p png_names
        # exit
        Calender.create(
            name: ttstr,
            photo1: pngs_flgs[0][0],
            photo2: pngs_flgs[0][1],
            photo3: pngs_flgs[0][2],
            photo4: pngs_flgs[0][3]
        )
        # @message="すでに取得済みの画像を表示します"
        display  =  Calender.last
        p display
        redirect_to '/nows'

    end

end
