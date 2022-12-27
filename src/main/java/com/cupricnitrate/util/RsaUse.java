package com.cupricnitrate.util;

import com.cupricnitrate.model.ClaimInfo;
import com.cupricnitrate.model.Payload;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.core.userdetails.User;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.List;

public class RsaUse {

    public static String getResourcesPath(){
        return RsaUse.class.getResource("/").getPath();
    }

    public static void main(String[] args) throws Exception {
        String path = getResourcesPath();
        System.out.println(path);
        //生成访问令牌公钥和私钥文件
        String keyPublicFilePath = "./auth_key/key/rsa_key.pub";
        String keyPrivateFilePath = "./auth_key/key/rsa_key";
        RsaUtils.generateKey(keyPublicFilePath, keyPrivateFilePath, "CupricNitrate Key Token");

        //生成刷新令牌公钥和私钥文件
        String refreshPublicFilePath = "./auth_key/refresh/rsa_key.pub";
        String refreshPrivateFilePath = "./auth_key/refresh/rsa_key";
        RsaUtils.generateKey(refreshPublicFilePath, refreshPrivateFilePath, "CupricNitrate Refresh Token");

//        //模拟加密生成token
//        PublicKey publicKey = RsaUtils.getPublicKey(keyPublicFilePath);
//        PrivateKey privateKey = RsaUtils.getPrivateKey(keyPrivateFilePath);
//
//        //权限设置
//        List<ClaimInfo.ClaimAuthority> authorities = new ArrayList<>();
//        ClaimInfo.ClaimAuthority authority = new ClaimInfo.ClaimAuthority();
//        authority.setAuthority("ROLE_USER");
//        authorities.add(authority);
//        //荷载数据
//        ClaimInfo claimInfo = ClaimInfo.builder()
//                .username("user")
//                .authorities(authorities)
//                .build();
//
//        //生成token
//        String token = JwtUtils.generateTokenExpire(claimInfo, privateKey, 24 * 60 * 60 * 1000, JwtUtils.createJTI());
//
//        System.out.println("token: " + token);
//
//        //模拟解密从token中获取用户信息
//        ObjectMapper objectMapper = new ObjectMapper();
//        //序列化时忽略值为null的属性
//        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
//
//        Payload<User> payload = JwtUtils.getInfoFromToken(token,
//                publicKey, User.class);
//        User user1 = payload.getUserInfo();
//        System.out.println("user: " + objectMapper.writeValueAsString(user1));
    }
}
