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

    Gson gson = new Gson();

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
}
