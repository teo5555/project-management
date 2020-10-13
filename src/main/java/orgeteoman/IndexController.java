package orgeteoman;


import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index(HttpServletRequest httpServletRequest) {
    	
    	if(httpServletRequest.isUserInRole("ADMIN")) {
            return "admin";
        } else if(httpServletRequest.isUserInRole("MEMBER")) {
            return "member";
        }else if(httpServletRequest.isUserInRole("LEADER")) {
            return "leader";
        } 
        else {
            return "index";
        }
    }
    

    @GetMapping("/member")
    public String member() {
        return "member";
    }

    @GetMapping("/leader")
    public String user() {
        return "leader";
    }

    @GetMapping("/admin")
    public String admin() {
        return "admin";
    }

}
