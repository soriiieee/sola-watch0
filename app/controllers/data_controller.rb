class DataController < ApplicationController
  def index
    @datas = Calender.last
    @path = "https://satelights.s3-ap-northeast-1.amazonaws.com"
    @path_assets = "overlay"

    @data_text = [
      "200hPa: WIND & HEIGHT & TEMPERATURE",
      "300hPa: WIND & HEIGHT & TEMPERATURE",
      "300hPa: WIND & HEIGHT & TEMPERATURE",
      "500hPa: WIND & HEIGHT & TEMPERATURE",
      "700hPa: WIND & HEIGHT & TEMPERATURE",
      "850hPa: WIND & HEIGHT & TEMPERATURE",
      "Rising AIR CURRENT",
      "ROTATION air",
      "EMAGRAM"
    ]
    @data_name = [
      "a200.png",
      "a300.png",
      "n300.png",
      "n500.png",
      "n700.png",
      "n850.png",
      "vwi1.png",
      "vro1.png",
      "emag.png"
    ]

    @height_icon = [
      "200hpa.jpg",
      "300hpa.jpg",
      "300hpa.jpg",
      "500hpa.jpg",
      "700hpa.jpg",
      "850hpa.jpg",
      "500hpa.jpg",
      "700hpa.jpg",
      "200hpa.jpg"
    ]

    @overlays = [
      "overlay200.png",
      "overlay300.png",
      "overlay_middle.png",
      "overlay_middle.png",
      "overlay_middle.png",
      "overlay_middle.png",
      "overlay_velo.png",
      "overlay_velo.png",
      "overlay_velo.png"
    ]
    #<Calender id: 17, name: "202001031700", start_time: nil, created_at: "2020-01-03 09:22:46", updated_at: "2020-01-03 09:22:46", photo1: "SPAS_COLOR_202001030000.png", photo2: "infrared_202001031700-00.png", photo3: "visible_202001031700-00.png", photo4: "watervapor_202001031700-00.png", photo5: nil, photo6: nil, photo7: nil, photo8: nil, photo9: nil, photo10: nil, data1: "a200.png", data2: "a300.png", data3: "n300.png", data4: "n500.png", data5: "n700.png", data6: "n850.png", data7: "vwi1.png", data8: "vro1.png", data9: "emag.png", data10: nil, datetime: nil, nation: nil>
    # p @datas
    p "#{@path_assets}/#{@overlays[1]}"
  end

  def show
  end
end
