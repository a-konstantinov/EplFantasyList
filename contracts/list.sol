pragma solidity ^0.5.0;

contract list {
	uint public taskCount = 0;

	struct Task {
		uint id;
		string content;
		bool completed;
	}

	mapping(uint => Task) public tasks;

	event TaskCreated(
		uint id,
		string content,
		bool completed
	);

	event TaskCompleted(
		uint id,
		bool completed
	);

	constructor() public {
		createTask("Original Task");
	}

	function createTask(string memory _content) public {
		taskCount ++;
		tasks[taskCount] = Task(taskCount, _content, false);
		emit TaskCreated(taskCount, _content, false);
	}

	function toggleCompleted(uint id) public {
		Task memory _task = tasks[id];
		_task.completed = !_task.completed;
		tasks[id] = _task;
		emit TaskCompleted(id, _task.completed);
	}
}