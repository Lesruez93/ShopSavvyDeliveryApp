import 'task.dart';

class SyncManager {
  static Future<void> synchronize() async {
    final List<Task> offlineTasks = TaskQueue.dequeueAll();
    try {
      await TaskService.fetchTasks(); // Fetch latest tasks from the server
      for (final task in offlineTasks) {
        await TaskService.createTask(task); // Create tasks on the server
      }
    } catch (e) {
      // Handle synchronization errors
    }
  }
}