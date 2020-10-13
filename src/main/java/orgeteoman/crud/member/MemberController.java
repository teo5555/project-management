package orgeteoman.crud.member;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import orgeteoman.crud.UserProjectTask.UserProjectTask;
import orgeteoman.crud.UserProjectTask.UserProjectTaskService;
import orgeteoman.crud.admin.User;
import orgeteoman.crud.leader.Task;
import orgeteoman.crud.leader.TaskService;

@Controller
public class MemberController {
	
	@Autowired
	UserProjectTaskService userProjectTaskService;
	
	@Autowired
	TaskService service;
    
	@GetMapping("memberTasksList")
	public String memberTasksList(Model model,
			Principal principal) {
		
		String username = principal.getName().toString();

	    List<UserProjectTask> listUserProjectTasks = userProjectTaskService.listAllByName(username);

	    model.addAttribute("tasks", listUserProjectTasks);

	     
	    return "tasksListByMember";
	    
	}
	
	@GetMapping("memberTasksView")
	public String memberTasksView(Model model,
			Principal principal) {
		
		String username = principal.getName().toString();

	    List<UserProjectTask> listUserProjectTasks = userProjectTaskService.listAllByName(username);

	    model.addAttribute("tasks", listUserProjectTasks);

	     
	    return "tasksViewByMember";
	    
	}
	
	@GetMapping("/showformForUpdateTaskByMember")
	public String showformForUpdateTaskByMember(@RequestParam("taskId") int theId,Model theModel) {
	
		Task task = service.get(theId);
	
		theModel.addAttribute("task",task);
		
		return "newTaskByMember";
		
	}

	@GetMapping("/memberListByUser")
	public String projectsListMembers(Model model,String roles) {
		roles="ROLE_MEMBER";
	    List<User> listUsers = service.findUsersByRoles(roles);
	    model.addAttribute("memberList", listUsers);
	     
	    return "listUsersByMember";
	    
	}
	
	@GetMapping("/memberOwnStatistics")
	public String projectMemberStatistics(Model model,String roles,Principal principal) {
		roles="ROLE_MEMBER";
		String username = principal.getName().toString();
		String stateDone ="DONE";
		String pending ="WORKING ON IT";

		
		String deadline = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	    
	    List<UserProjectTask> listUserProjectTasks = userProjectTaskService.listAllByName(username);
	    

	    List<UserProjectTask>  completedTasksOnTime= userProjectTaskService.completedTasksOnTimeOwn(stateDone, username, deadline);
	    List<UserProjectTask>  completedTasksOutTime= userProjectTaskService.completedTasksOutTimeOwn(stateDone, username, deadline);
	    List<UserProjectTask>  pendingState= userProjectTaskService.pendingStateOwn(pending, username);
	    
	    
	    model.addAttribute("listUserProjectTasks", listUserProjectTasks);
	    model.addAttribute("completedTasksOnTime", completedTasksOnTime);
	    model.addAttribute("completedTasksOutTime", completedTasksOutTime);
	    model.addAttribute("pendingState", pendingState);
	     
	    return "memberStatistics";
	    
	}
	
}
