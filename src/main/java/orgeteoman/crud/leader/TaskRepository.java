package orgeteoman.crud.leader;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import orgeteoman.crud.DTO.ProjectUserDTO;
import orgeteoman.crud.admin.User;


public interface TaskRepository extends JpaRepository<Task, Integer>{
	
    @Query("SELECT u from User u  where u.roles=:roles")
	List<User> findUsersByRoles(String roles);
    
    @Query("SELECT new orgeteoman.crud.DTO.ProjectUserDTO (u.userName,u.roles,u.id,p.id,p.title) from User u JOIN u.projects p where u.roles=:roles")
  	List<ProjectUserDTO> findAllProjectUsersByLeader(String roles);
    
    @Query("SELECT new orgeteoman.crud.DTO.ProjectUserDTO (u.userName,u.roles,u.id,p.id,p.title,p.description,p.start_date,p.end_date) from User u JOIN u.projects p where u.roles=:roles ORDER BY p.end_date")
  	List<ProjectUserDTO> findAllProjectUsersListByLeader(String roles);
    
    @Query("SELECT new orgeteoman.crud.DTO.ProjectUserDTO (u.userName,u.roles,u.id,p.id,p.title,p.description,p.start_date,p.end_date) from User u JOIN u.projects p where u.roles=:roles AND u.id=:id ORDER BY p.end_date")
  	List<ProjectUserDTO> findAllProjectUsersStatisticsByLeader(String roles,int id);
   
    @Query("SELECT t from Task t ORDER BY t.deadline")
    public List<Task> listAllTasksOrdered();
  

}
