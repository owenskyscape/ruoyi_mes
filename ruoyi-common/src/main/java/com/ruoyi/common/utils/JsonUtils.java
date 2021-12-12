/**
 * @title: JsonUtils.java
 * @description: 注解类
 * @author DaiChao
 * <p>
 * Copyright(C) 2018-2019    NPlus
 * Company:   DC
 * @version V1.0
 * @date: 21:39 2019/5/8
 * <p>
 * 修改历史:
 * Date          Author        Version        Description
 * -----------------------------------------------------------------------------------
 * 2019/5/8       DaiChao        1.0            初始化版本
 */
package com.ruoyi.common.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Slf4j
public class JsonUtils {

    /**
     * 对象转Json字符串
     *
     * @param o 对象
     * @return String
     */
    public static String toJsonString(Object o) {
        return toJson(o);
    }

    private static String decode(String body) {
        try {
            return URLDecoder.decode(body, "UTF-8");
        } catch (Exception e) {
            log.warn(e.getLocalizedMessage());
            return body;
        }
    }

    /**
     * Json 转成 Map对象
     */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> toMap(String body) {

        try {
            body = decode(body);
            ObjectMapper om = getObjectMapper();
            return om.readValue(body, Map.class);
        } catch (IOException e) {
            log.warn(e.getLocalizedMessage());
        }
        return null;
    }

    /**
     * Json 转 Class
     */
    public static Object toClass(String body, Class<?> cla) {
        try {
            body = decode(body);
            ObjectMapper om = getObjectMapper();
            return om.readValue(body, cla);
        } catch (IOException e) {
            log.warn(e.getLocalizedMessage());
        }
        return null;
    }

    /**
     * Map 转换为 对象
     */
    public static Object mapToBean(Class<?> cla, Map<String, Object> map) {

        try {
            Field[] fields = cla.getDeclaredFields();
            String fname = null;
            Method method = null;
            Object obj = null;
            Object bean = null;

            bean = Class.forName(cla.getName()).newInstance();

            for (Field field : fields) {
                fname = field.getName();
                if (map.containsKey(fname)) {
                    obj = map.get(fname);
                    if (obj == null) {
                        method = cla.getMethod("set" + fname.substring(0, 1).toUpperCase() + fname.substring(1), field.getType());
                    } else {
                        method = cla.getMethod("set" + fname.substring(0, 1).toUpperCase() + fname.substring(1), obj.getClass());
                    }
                    method.invoke(bean, obj);
                }
            }
        } catch (Exception e) {
            log.error("转换异常：", e);
        }
        return null;
    }

    /**
     * 将map内的数据添加到对象中
     */
    public static void assignByMap(Object object, Map<String, Object> map) {
        Class<?> type = object.getClass();
        Class<?> attrType = null;
        List<Field> fields = new ArrayList<>();

        for (Class<?> clazz = object.getClass(); clazz != Object.class; clazz = clazz.getSuperclass()) {
            Collections.addAll(fields, clazz.getDeclaredFields());
        }

        String fname;
        Method method;
        Object obj;
        for (Field field : fields) {
            fname = field.getName();
            if (map.containsKey(fname)) {
                obj = map.get(fname);
                attrType = field.getType();
                if (attrType.equals(long.class) || attrType.equals(Long.class)) {
                    if (obj != null) {
                        obj = Long.parseLong(obj.toString());
                    }
                } else if (attrType.equals(BigDecimal.class)) {
                    if (obj != null) {
                        obj = new BigDecimal(obj.toString());
                    }
                } else if (attrType.equals(BigInteger.class)) {
                    if (obj != null) {
                        obj = new BigInteger(obj.toString());
                    }

                } else if (attrType.equals(Double.class) || attrType.equals(double.class)) {
                    if (obj != null) {
                        obj = Double.parseDouble(obj.toString());
                    }
                } else if (attrType.equals(Float.class) || attrType.equals(float.class)) {
                    if (obj != null) {
                        obj = Float.parseFloat(obj.toString());
                    }
                } else if (attrType.equals(Boolean.class) || attrType.equals(boolean.class)) {
                    if (obj != null) {
                        obj = Boolean.parseBoolean(obj.toString());
                    }
                } else if (attrType.equals(Integer.class) || attrType.equals(int.class)) {
                    if (obj != null) {
                        obj = Integer.parseInt(obj.toString());
                    }
                }
                try {
                    method = type.getMethod("set" + fname.substring(0, 1).toUpperCase() + fname.substring(1), field.getType());
                    method.invoke(object, obj);
                } catch (Exception e) {
                    log.warn(e.getLocalizedMessage());
                }
            }
        }

    }

    /**
     * 解析JSON 生成字符串数组
     */
    public static String[] toStringArray(String body) {
        body = decode(body);

        body = body.replace("[", "");
        body = body.replace("]", "");
        body = body.replaceAll("\"", "");

        return body.split(",");
    }

    /**
     * 解析Json string生成c类型的对象 只支持UTF-8编码的字符串
     *
     * @param body  String json字符串
     * @param clazz Class要生成的对象类型
     * @return Object 解析生成的对象，解析不成功返回null，错误记录在日志中。
     */
    public static <T> T toObject(String body, Class<T> clazz) {
        try {
            body = decode(body);
            ObjectMapper om = getObjectMapper();
            return om.readValue(body, clazz);
        } catch (JsonParseException | JsonMappingException e) {
            log.warn(e.getLocalizedMessage());
        } catch (IOException e) {
            log.error(e.getLocalizedMessage());
        }
        return null;
    }

    /**
     * 解析Json string生成c类型的对象列表 只支持UTF-8编码的字符串
     *
     * @param body  String json字符串
     * @param clazz Class要生成的对象类型
     * @return <T> List<T> 解析生成的对象，解析不成功返回null，错误记录在日志中。
     */
    public static <T> List<T> toList(String body, Class<?> clazz) {
        try {
            body = decode(body);
            ObjectMapper om = getObjectMapper();
            TypeFactory t = TypeFactory.defaultInstance();
            return om.readValue(body, t.constructCollectionType(ArrayList.class, clazz));
        } catch (IOException e) {
            log.error(e.getLocalizedMessage());
        }
        return new ArrayList<>(0);
    }

    /**
     * 把JavaBean转换为json字符串
     * (1)普通对象转换：toJson(Student)
     * (2)List转换：toJson(List)
     * (3)Map转换:toJson(Map) 我们发现不管什么类型，都可以直接传入这个方法
     */
    public static String toJson(Object object) {

        try {
            ObjectMapper om = getObjectMapper();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            om.setDateFormat(sdf);
            om.setSerializationInclusion(JsonInclude.Include.NON_NULL);

            return om.writeValueAsString(object);
        } catch (Exception e) {
            log.error("转换异常：", e);
        }

        return "";
    }

    /**
     * 把JavaBean转换为json字符串
     * (1)普通对象转换：toJson(Student)
     * (2)List转换：toJson(List)
     * (3)Map转换:toJson(Map) 我们发现不管什么类型，都可以直接传入这个方法
     */
    public static JsonNode toJsonNode(Object object) {
        ObjectMapper om = getObjectMapper();
        try {
            return om.readTree(om.writeValueAsString(object));
        } catch (JsonProcessingException e) {
            log.error("转换异常：", e);
        }
        return null;
    }


    public static byte[] toByte(Object object) {
        ObjectMapper om = getObjectMapper();
        try {
            return om.writeValueAsBytes(object);
        } catch (JsonProcessingException e) {
            log.error("转换异常：", e);
        }
        return new byte[0];
    }

    private static ObjectMapper getObjectMapper() {
        ObjectMapper om = new ObjectMapper();
        om.configure(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
        om.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);
        om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        return om;
    }
}
