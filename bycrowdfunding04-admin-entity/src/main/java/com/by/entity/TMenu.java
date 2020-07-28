package com.by.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author rj
 * @since 2020-07-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TMenu implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer pid;

    private String name;

    private String url;

    private String icon;
    // 存储子节点的集合，初始化是为了避免指针异常
    @TableField(exist = false) //表示该属性不为数据库表字段，但又是必须使用的。
    private List<TMenu> children = new ArrayList<>();
    // 控制节点是否默认为打开装，设置为true表示默认打开
    @TableField(exist = false)
    private Boolean open = true;

}
