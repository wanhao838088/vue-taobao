package io.renren.service;

import com.baomidou.mybatisplus.service.IService;
import io.renren.entity.GoodsComment;

/**
 * GoodsComment
 * @author admin
 */
public interface GoodsCommentService extends IService<GoodsComment> {


    /**
     * 查询评论总数
     * @return
     */
    public Integer getCount();
}
