package com.by.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.by.entity.TMenu;
import com.by.mapper.TMenuDao;
import com.by.service.TMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author rj
 * @since 2020-07-28
 */
@Service
public class TMenuServiceImpl extends ServiceImpl<TMenuDao, TMenu> implements TMenuService {

    @Autowired
    private  TMenuDao menuDao;

}
