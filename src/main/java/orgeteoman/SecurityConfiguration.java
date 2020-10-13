package orgeteoman;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
        .antMatchers("/admin").hasRole("ADMIN")
        .antMatchers("/new").hasRole("ADMIN")
        .antMatchers("/newProject").hasRole("ADMIN")
        .antMatchers("/users").hasRole("ADMIN")
        .antMatchers("/projects").hasRole("ADMIN")
        .antMatchers("/showProjectUpdate").hasRole("ADMIN")
        .antMatchers("/showformForUpdate").hasRole("ADMIN")
        .antMatchers("/showAddProjectUser").hasRole("ADMIN")
        .antMatchers("/projectUsers").hasRole("ADMIN")
        .antMatchers("/deleteProjectUser").hasRole("ADMIN")
        
        .antMatchers("/tasks").hasAnyRole("LEADER")
        .antMatchers("/newTask").hasAnyRole("LEADER")
        .antMatchers("/deleteTask").hasAnyRole("LEADER")
        .antMatchers("/showformForUpdateTask").hasAnyRole("LEADER")
        .antMatchers("/projectsByLeader").hasAnyRole("LEADER")
        .antMatchers("/showAddProjectUserByLeader").hasAnyRole("LEADER")
        .antMatchers("/showAddProjectTask").hasAnyRole("LEADER")
        .antMatchers("/showAddProjectUserByLeader").hasAnyRole("LEADER")
        .antMatchers("/projectsListMembers").hasAnyRole("LEADER")
        .antMatchers("/listUsersForLeader").hasAnyRole("LEADER")
        .antMatchers("/projectMemberStatistics").hasAnyRole("LEADER")
        .antMatchers("/showMemberProjectTask").hasAnyRole("LEADER")
        .antMatchers("/deleteProjectUserByLeader").hasAnyRole("LEADER")
        .antMatchers("/tasksList").hasAnyRole("LEADER")
        
        .antMatchers("/memberTasksView").hasAnyRole("MEMBER")
        .antMatchers("/memberTasksList").hasAnyRole("MEMBER")
        .antMatchers("/showformForUpdateTaskByMember").hasAnyRole("MEMBER")
        .antMatchers("/memberListByUser").hasAnyRole("MEMBER")
        .antMatchers("/memberOwnStatistics").hasAnyRole("MEMBER")
       
        
        .antMatchers("/leader").hasAnyRole("LEADER","ADMIN")
        .antMatchers("/member").hasAnyRole("MEMBER","ADMIN","LEADER")
        .antMatchers("/").hasAnyRole("ADMIN","LEADER","MEMBER")
        .and().formLogin()
         .permitAll()
         .and().logout().permitAll();
                
    }
    

    


    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }
}
