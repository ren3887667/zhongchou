package com.by.controller;

import com.by.entity.TMenu;
import com.by.service.TMenuService;
import com.by.util.ResultEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author rj
 * @since 2020-07-28
 */
@RestController
@RequestMapping("/tMenu")
public class TMenuController {

    @Autowired
    private TMenuService menuService;


/*    @ResponseBody
    @RequestMapping("/menu/remove.json")
    public ResultEntity<String> removeMenu(@RequestParam("id") Integer id) {
        menuService.removeById(id);
        return ResultEntity.successWithoutData();
    }

    @ResponseBody
    @RequestMapping("/menu/update.json")
    public ResultEntity<String> updateMenu(TMenu menu) {

        menuService.updateMenu(menu);

        return ResultEntity.successWithoutData();
    }

    @ResponseBody
    @RequestMapping("/menu/save.json")
    public ResultEntity<String> saveMenu(TMenu menu) {

        // Thread.sleep(2000);
        menuService.save(menu);
        return ResultEntity.successWithoutData();
    }
**/
    @ResponseBody
    @RequestMapping("/menu/get/whole/tree.json")
    public ResultEntity<TMenu> getWholeTreeNew() {

        // 1.查询全部的Menu对象
        List<TMenu> menuList = menuService.list();
        // 2.声明一个变量用来存储找到的根节点
                TMenu root = null;

        // 3.创建Map对象用来存储id和Menu对象的对应关系便于查找父节点
        Map<Integer, TMenu> menuMap = new HashMap<>();

        // 4.遍历menuList填充menuMap
        for (TMenu menu : menuList) {

            Integer id = menu.getId();

            menuMap.put(id, menu);
        }

        // 5.再次遍历menuList查找根节点、组装父子节点
        for (TMenu menu : menuList) {

            // 6.获取当前menu对象的pid属性值
            Integer pid = menu.getPid();

            // 7.如果pid为null，判定为根节点
            if(pid == null) {
                root = menu;

                // 8.如果当前节点是根节点，那么肯定没有父节点，不必继续执行
                continue ;
            }

            // 9.如果pid不为null，说明当前节点有父节点，那么可以根据pid到menuMap中查找对应的Menu对象
            TMenu father = menuMap.get(pid);

            // 10.将当前节点存入父节点的children集合
            father.getChildren().add(menu);
        }

        // 11.经过上面的运算，根节点包含了整个树形结构，返回根节点就是返回整个树
        return com.by.util.ResultEntity.successWithData(root);
    }

    public com.by.util.ResultEntity<TMenu> getWholeTreeOld() {

        // 1.查询全部的Menu对象
        List<TMenu> menuList = menuService.list();

        // 2.声明一个变量用来存储找到的根节点
        TMenu root = null;

        // 3.遍历menuList
        for (TMenu menu : menuList) {

            // 4.获取当前menu对象的pid属性值
            Integer pid = menu.getPid();

            // 5.检查pid是否为null
            if(pid == null) {

                // 6.把当前正在遍历的这个menu对象赋值给root
                root = menu;

                // 7.停止本次循环，继续执行下一次循环
                continue ;
            }

            // 8.如果pid不为null，说明当前节点有父节点，找到父节点就可以进行组装，建立父子关系
            for (TMenu maybeFather : menuList) {

                // 9.获取maybeFather的id属性
                Integer id = maybeFather.getId();

                // 10.将子节点的pid和疑似父节点的id进行比较
                if(Objects.equals(pid, id)) {

                    // 11.将子节点存入父节点的children集合
                    maybeFather.getChildren().add(menu);

                    // 12.找到即可停止运行循环
                    break ;
                }

            }
        }

        // 13.将组装的树形结构（也就是根节点对象）返回给浏览器
        return com.by.util.ResultEntity.successWithData(root);
    }
}

