package orgeteoman.crud.UserProjectTask;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import orgeteoman.crud.DTO.ProjectUserDTO;
import orgeteoman.crud.admin.User;
import orgeteoman.crud.admin.UserService;
import orgeteoman.crud.leader.Task;
import orgeteoman.crud.leader.TaskService;
import orgeteoman.crud.project.Project;
import orgeteoman.crud.project.ProjectService;

@Controller
public class UserProjectTaskController {
	
	@Autowired
	UserProjectTaskService userProjectTaskService;
	
	@Autowired
	TaskService service;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProjectService projectService;
	
	@PostMapping("/saveTaskProject")
	public String saveProjectTask(@RequestParam("task.id") int taskId,
			@RequestParam("project.id") int projectId,@RequestParam("user.id") int userId){
		
		Task theTask = service.get(taskId);
		Project theProject = projectService.get(projectId);
		User theUser = userService.get(userId);
		
		UserProjectTask userProjectTask = new UserProjectTask();
		userProjectTask.setId(new UserProjectTaskPk());
		userProjectTask.setUser(theUser);
		userProjectTask.setProject(theProject);
		userProjectTask.setTask(theTask);
		
		userProjectTaskService.save(userProjectTask);
	
		return "redirect:/";
}
	

	@GetMapping("/projectMemberStatistics")
	public String projectMemberStatistics(Model model,String roles,@RequestParam("userId") int userId) {
		roles="ROLE_MEMBER";
	    List<ProjectUserDTO> listUsers = service.findAllProjectUsersStatisticsByLeader(roles,userId);
	    model.addAttribute("projectUserByLeader", listUsers);
	     
	    return "projectMembersStatisticsByLeader";
	    
	}
	
	@GetMapping("/showMemberProjectTask")
	public String showMemberProjectTask(Model model,
			@RequestParam("projectId") int projectId,@RequestParam("userId") int userId) {
		String stateDone ="DONE";
		String pending ="WORKING ON IT";

		
		String deadline = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	    
	    List<UserProjectTask> listUserProjectTasks = userProjectTaskService.listAllById(userId,projectId);
	    

	    List<UserProjectTask>  completedTasksOnTime= userProjectTaskService.completedTasksOnTime(stateDone, userId, projectId, deadline);
	    List<UserProjectTask>  completedTasksOutTime= userProjectTaskService.completedTasksOutTime(stateDone, userId, projectId, deadline);
	    List<UserProjectTask>  pendingState= userProjectTaskService.pendingState(pending, userId, projectId);
	    
	    
	    model.addAttribute("listUserProjectTasks", listUserProjectTasks);
	    model.addAttribute("completedTasksOnTime", completedTasksOnTime);
	    model.addAttribute("completedTasksOutTime", completedTasksOutTime);
	    model.addAttribute("pendingState", pendingState);
	     
	    return "showUserProjectTask";
	    
	}
}
