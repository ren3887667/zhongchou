package com.by.controller;


import com.baomidou.mybatisplus.extension.conditions.query.QueryChainWrapper;
import com.by.entity.TMenu;
import com.by.entity.TTag;
import com.by.service.TTagService;
import com.by.util.ResultEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yc
 * @since 2020-07-29
 */
@RestController
@RequestMapping("/tTag")
public class TTagController {

    @Autowired
    private TTagService tTagService;

    @ResponseBody
    @RequestMapping("/tag/get/whole/tree.json")
    public ResultEntity<TTag> getWholeTreeNew() {
        //1.查询所有节点的数据
        List<TTag> list = tTagService.list();

        //2.声明根节点
        TTag root = null;

        // 3.创建Map对象用来存储id和Tag对象的对应关系便于查找父节点
        HashMap<Integer, TTag> tTagHashMap = new HashMap<>();

        // 4.遍历menuList填充menuMap
        for (TTag tTag : list) {
            Integer id = tTag.getId();
            tTagHashMap.put(id, tTag);
        }

        // 5.再次遍历menuList查找根节点、组装父子节点
        for (TTag tTag : list) {
            // 6.获取当前menu对象的pid属性值
            Integer pid = tTag.getPid();

            // 7.如果pid为null，判定为根节点
            if(pid == 0) {
                root = tTag;
                // 8.如果当前节点是根节点，那么肯定没有父节点，不必继续执行
                continue ;
            }
            // 9.如果pid不为null，说明当前节点有父节点，那么可以根据pid到menuMap中查找对应的Menu对象
            TTag father = tTagHashMap.get(pid);

            // 10.将当前节点存入父节点的children集合
            father.getChildren().add(tTag);
        }
        return ResultEntity.successWithData(root);
    }

}

