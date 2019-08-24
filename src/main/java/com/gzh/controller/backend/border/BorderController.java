package com.gzh.controller.backend.border;

import com.gzh.pojo.Border;
import com.gzh.service.BorderService;
import com.gzh.utils.ResponseResult;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-04-05 0:25
 */
@Controller
public class BorderController {

    @Autowired
    private BorderService borderService;

    @RequestMapping("/backend/skipToAddBorder")
    public String skipToAddBorder(){

        return "/backend/border/addBorder";
    }

    /**
     * 跳转到餐桌列表
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipToBorderList")
    public String skipToBorderList(Model model){

        System.out.println("---------------------------skipToBorderList11----------------------");
       List<Border> borders = borderService.selectAllBorder();

        model.addAttribute("borders",borders);
        return "/backend/border/borderList";
    }

    /**
     * 修改餐桌状态
     * @param id
     * @param status
     * @return
     */
    @RequestMapping("/backend/updateBorderStatus")
    @ResponseBody
    public ResponseResult updateBorderStatus(int id,int status){

        if (status==0){
            status=1;
        }
        if(status==1){
            status=0;
        }
        int i = borderService.updateBorderStatus(id, status);

        if (i>0){
            return  ResponseResult.success();
        }else{
            return ResponseResult.fail();
        }
    }

    @RequestMapping("/backend/deleteBorder")
    @ResponseBody
    public ResponseResult deleteBorder(int id){



       borderService.deleteBorderById(id);

        return ResponseResult.success();
    }

}
