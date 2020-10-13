package orgeteoman.crud.leader;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import orgeteoman.crud.DTO.ProjectUserDTO;
import orgeteoman.crud.admin.User;

@Service
@Repository
public class TaskService {
	
	@Autowired
	TaskRepository repo;
	
    public List<Task> listAllTasksOrdered() {
        return repo.listAllTasksOrdered();
    }
    
    public List<Task> listAllTasks() {
        return repo.findAll();
    }
     
    public void save(Task task) {
        repo.save(task);
    }
     
    public Task get(int id) {
        return repo.findById(id).get();
    }
     
    public void delete(int id) {
        repo.deleteById(id);
    }
    
	 public List<ProjectUserDTO> findAllProjectUsersByLeader(String roles){
		 return repo.findAllProjectUsersByLeader(roles);
	 }
	 
	 public List<ProjectUserDTO> findAllProjectUsersListByLeader(String roles){
		 return repo.findAllProjectUsersListByLeader(roles);
	 }

    
	public List<User> findUsersByRoles(String roles){
		return repo.findUsersByRoles(roles);
	}
	
	 public List<ProjectUserDTO> findAllProjectUsersStatisticsByLeader(String roles,int id){
		 return repo.findAllProjectUsersStatisticsByLeader(roles, id);
	 }


}
