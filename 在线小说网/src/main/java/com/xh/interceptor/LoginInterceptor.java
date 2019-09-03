package com.xh.interceptor;

import com.xh.pojo.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginInterceptor implements HandlerInterceptor {
    /**
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return  true:放行, false: 拦截不放行
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        // 先去获取session对象
       /* HttpSession session = httpServletRequest.getSession();
        // 判断session对象中是否保存了 登陆的用户信息?
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin == null){
            // session中没有 用户登陆的信息
            // 重定向到 登陆页面
            // 如何重定向呢?
            String contextPath = httpServletRequest.getContextPath();
            httpServletResponse.sendRedirect(contextPath+"/loginPage");
            return false;
        }*/

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
