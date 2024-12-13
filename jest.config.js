module.exports = {
    testEnvironment: 'node',
    testMatch: ['**/**/*.test.js'],
    verbose: true,
    collectCoverage: false,
    reporters: [
        'default',
        ['jest-junit', {
            outputDirectory: 'test-results',
            outputName: 'junit.xml',
        }]
    ],
};

