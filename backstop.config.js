const glob = require("glob")
const pathUtil = require('path');

const args = process.env //get the process env
if (!args.refBaseUrl) {
	args.refBaseUrl = 'https://www-dev-ac.cancer.gov';
}
if (!args.testBaseUrl) {
	args.testBaseUrl = 'https://www-dev-ac.cancer.gov';
}
const isACSF = args.testBaseUrl.toLowerCase().includes('acsf') || args.refBaseUrl.toLowerCase().includes('acsf')
const scenarioFiles = glob.sync('backstop_data/scenarios/**/*.js');

const scenariosExpanded = scenarioFiles.reduce((ac, scenarioFile) => {
	const scenarios = require(pathUtil.resolve(__dirname, scenarioFile));
	const cleanedScenarios = scenarios.map((scenario) => ({
		...scenario,
		url: `${args.testBaseUrl}${scenario.testPath}`,
		referenceUrl: `${args.refBaseUrl}${scenario.testPath}`,
		delay: 2000,
		label: scenario.specific && isACSF ? scenario.label + '_acsf' : scenario.label,
		removeSelectors: scenario.enableBackToTop ? [] : ['div.usa-footer__nci-return-to-top']
	}));
	return [...ac, ...cleanedScenarios];
}, []);

module.exports = {
	id: 'backstop_default',
	viewports: [
		{
			label: 'desktop',
			width: 1025,
			height: 600,
		},
		{
			label: 'mobile',
			width: 320,
			height: 800,
		},
		{
			label: 'tablet',
			width: 650,
			height: 900,
		},
	],
	scenarios: [...scenariosExpanded],
	onBeforeScript: "playwright/onBefore.js",
	onReadyScript: "playwright/onReady.js",
	paths: {
		bitmaps_reference: 'backstop_data/reference',
		bitmaps_test: 'backstop_data/test',
		engine_scripts: 'backstop_data/engine_scripts/',
		html_report: 'backstop_data/html-report',
		ci_report: 'backstop_data/ci-report',
	},
	report: ['browser'],
	engine: 'playwright',
	engineOptions: {
		browser: 'chromium',
		args: ['--no-sandbox', '--disable-setuid-sandbox'],
	},
	asyncCaptureLimit: 2,
	asyncCompareLimit: 50,
	debug: false,
	debugWindow: false,
	misMatchThreshold: 0.1,
	resembleOutputOptions: {
		usePreciseMatching: true,
	}
};
