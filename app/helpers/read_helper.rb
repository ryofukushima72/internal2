module ReadHelper
    def translation_class_level(level)
        if level == "S:営業"
            return "s_color"
        elsif level == "P:PoC"
            return "p_color"
        elsif level == "D:開発"
            return "d_color"
        elsif level == "M:運用"
            return "m_color"
        elsif level == "T:追加学習"
            return "t_color"
        elsif level == "R:Royalty"
            return "r_color"
        elsif level == "F:完了"
            return "f_color"
        elsif level == "G:休眠"
            return "g_color"
        elsif level == "H:失注"
            return "h_color"
        elsif level == "未定"
            return "z_color"

        end
    end

    def translation_class_month(month)
        if month == 0
            return "pj_color_off"
        else
            return "pj_color_on"
        end
    end

    def detect_month(name)
        return "name"
    end

    def translation_class_price_1904(month)
        if month.in?(['y1905','y1906','y1907','y1908','y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_1905(month)
        if month.in?(['y1906','y1907','y1908','y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_1906(month)
        if month.in?(['y1907','y1908','y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_1907(month)
        if month.in?(['y1908','y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_1908(month)
        if month.in?(['y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_1909(month)
        if month.in?(['y1910','y1911','y1912','y2001','y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_1910(month)
        if month.in?(['y1911','y1912','y2001','y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_1911(month)
        if month.in?(['y1912','y2001','y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_1912(month)
        if month.in?(['y2001','y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_2001(month)
        if month.in?(['y2002','y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_2002(month)
        if month.in?(['y2003'])
            return "price_color_past"
        else
            return "price_color_future"
        end
    end

    def translation_class_price_2003(month)
            return "price_color_future"
    end

    def translation_color_graph_1904(month)
        if month.in?(['y1905','y1906','y1907','y1908','y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_1905(month)
        if month.in?(['y1906','y1907','y1908','y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_1906(month)
        if month.in?(['y1907','y1908','y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_1907(month)
        if month.in?(['y1908','y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_1908(month)
        if month.in?(['y1909','y1910','y1911','y1912','y2001','y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_1909(month)
        if month.in?(['y1910','y1911','y1912','y2001','y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_1910(month)
        if month.in?(['y1911','y1912','y2001','y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_1911(month)
        if month.in?(['y1912','y2001','y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_1912(month)
        if month.in?(['y2001','y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_2001(month)
        if month.in?(['y2002','y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_2002(month)
        if month.in?(['y2003'])
            return '#41A317'
        else
            return '#2554c7'
        end
    end

    def translation_color_graph_2003(month)
            return '#2554c7'
    end

    def file_a(pj_id)
        file = FileUpload.where(pj_id: pj_id)
        file1 = file.where(category: "a.NDA")
        file2 = file1.count
        if file1.empty?
            return 0
        else
            return file2
        end
    end

    # def file_b(pj_id)
    #     file = FileUpload.where(pj_id: pj_id)
    #     file1 = file.where(category: "b.見積書")
    #     file2 = file1.count
    #     if file1.empty?
    #         return 0
    #     else
    #         return file2
    #     end
    # end

    # def file_c(pj_id)
    #     file = FileUpload.where(pj_id: pj_id)
    #     file1 = file.where(category: "c.契約書")
    #     file2 = file1.count
    #     if file1.empty?
    #         return 0
    #     else
    #         return file2
    #     end
    # end

    # def file_d(pj_id)
    #     file = FileUpload.where(pj_id: pj_id)
    #     file1 = file.where(category: "d.請求書")
    #     file2 = file1.count
    #     if file1.empty?
    #         return 0
    #     else
    #         return file2
    #     end
    # end

    # def file_e(pj_id)
    #     file = FileUpload.where(pj_id: pj_id)
    #     file1 = file.where(category: "e.議事録")
    #     file2 = file1.count
    #     if file1.empty?
    #         return 0
    #     else
    #         return file2
    #     end
    # end

    # def file_f(pj_id)
    #     file = FileUpload.where(pj_id: pj_id)
    #     file1 = file.where(category: "f.検収書")
    #     file2 = file1.count
    #     if file1.empty?
    #         return 0
    #     else
    #         return file2
    #     end
    # end

    # def file_g(pj_id)
    #     file = FileUpload.where(pj_id: pj_id)
    #     file1 = file.where(category: "g.注文書")
    #     file2 = file1.count
    #     if file1.empty?
    #         return 0
    #     else
    #         return file2
    #     end
    # end


end
