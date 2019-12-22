class CheckTime
    def self.getImageTime()
        time_jst = Time.now
        time_utc = time_jst.ago(9.hour)
        time_check_flag = time_jst.strftime("%H").to_i

        # hh= time.strftime("%H")

        #01:00~04:00 ---> 21:00 data ---> 12:00(utc)
        if (time_check_flag>= 0 && time_check_flag<3+1)
            time_get_image= time_utc.strftime("%Y%m%d1200")
            time_jst2 = time_jst.strftime("%Y-%m-%d 21:00")
            time_jst_dir = time_jst.strftime("%Y%m%d2100")
            hh= "12"
        #4:00~07:00 ---> 03:00 data ---> 18:00(utc)
        elsif time_check_flag>= 3+1 && time_check_flag<6+1
            time_get_image= time_utc.strftime("%Y%m%d1800")
            time_jst2 = time_jst.strftime("%Y-%m-%d 03:00")
            time_jst_dir = time_jst.strftime("%Y%m%d0300")
            hh= "18"
        #7:00~010:00 ---> 06:00 data ---> 21:00(utc)
        elsif time_check_flag>= 6+1 && time_check_flag<9+1
            time_get_image= time_utc.strftime("%Y%m%d2100")
            time_jst2 = time_jst.strftime("%Y-%m-%d 06:00")
            time_jst_dir = time_jst.strftime("%Y%m%d0600")
        #10:00~13:00 ---> 09:00 data ---> 00:00(utc)
        elsif time_check_flag>= 9+1 && time_check_flag<12+1
            time_get_image= time_utc.strftime("%Y%m%d0000")
            time_jst2 = time_jst.strftime("%Y-%m-%d 09:00")
            time_jst_dir = time_jst.strftime("%Y%m%d0900")
        #13:00~16:00 ---> 12:00 data ---> 03:00(utc)
        elsif time_check_flag>= 12+1 && time_check_flag<15+1
            time_get_image= time_utc.strftime("%Y%m%d0300")
            time_jst2 = time_jst.strftime("%Y-%m-%d 12:00")
            time_jst_dir = time_jst.strftime("%Y%m%d1200")
        #16:00~19:00 ---> 15:00 data ---> 06:00(utc)
        elsif time_check_flag>= 15+1 && time_check_flag<18+1
            time_get_image= time_utc.strftime("%Y%m%d0600")
            time_jst2 = time_jst.strftime("%Y-%m-%d 15:00")
            time_jst_dir = time_jst.strftime("%Y%m%d1500")
        #19:00~22:00 ---> 18:00 data ---> 09:00(utc)
        elsif time_check_flag>= 18+1 && time_check_flag<21+1
            time_get_image= time_utc.strftime("%Y%m%d0900")
            time_jst2 = time_jst.strftime("%Y-%m-%d 18:00")
            time_jst_dir = time_jst.strftime("%Y%m%d1800")
        #22:00~25:00 ---> 21:00 data ---> 12:00(utc)
        # elsif time_check_flag>= 21+1 && time_check_flag<=24
        else
            time_get_image= time_utc.strftime("%Y%m%d1200")
            time_jst2 = time_jst.strftime("%Y-%m-%d 21:00")
            time_jst_dir = time_jst.strftime("%Y%m%d2100")
        
        end
        return [time_get_image,time_jst_dir,time_jst2]
    end
end
