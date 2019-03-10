package io.renren.utils;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by LiuLiHao on 2019/3/8 0008 下午 03:56
 * @author : LiuLiHao
 * 描述：
 */
@Component
public class RedisTemplatesUtil {
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    public static Gson gson = new Gson();

    /**
     * 保存list
     * @param key
     * @param list
     */
    public void setList(String key,List list){
        redisTemplate.opsForValue().set(key,gson.toJson(list));
    }

    /**
     * 获取list
     * @param key
     * @return
     */
    public String getListString(String key){
        return (String) redisTemplate.opsForValue().get(key);
    }

    /**
     * 转json
     * @param object
     * @return
     */
    public static String toJson(Object object){
        return gson.toJson(object);
    }

    /**
     * 减少一个
     * @param goodsId
     * @return
     */
    public long decrement(String goodsId) {
        Long count = (Long) redisTemplate.opsForValue().get(goodsId);
        redisTemplate.opsForValue().set(goodsId,--count);
        return count;
    }
}
