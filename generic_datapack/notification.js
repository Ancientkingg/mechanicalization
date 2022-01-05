const notifier = require('node-notifier');

module.exports = () => {
	notifier.notify({
		title: 'MC-Build',
		message: 'Finished Build',
		icon: "C:/Users/Familie/AppData/Roaming/npm/node_modules/mc-build/assets/MCB_computer_icon.png",
	});
}