# P4SaMD Jest Test Suite Template

This repository is a template to create and run Jest test suites for P4SaMD. It enables you to write tests, execute them, and automatically send the results to a specified endpoint.

## Features
- Supports Jest for writing and running tests.
- Automatically exports test results in JUnit XML format.
- Sends test results to the P4SaMD backend.

## Prerequisites
1. [Node.js](https://nodejs.org/) installed on your machine.
2. An `.env` file with the following environment variables:
   - `P4SAMD_BACKEND_HOST`: The base URL of the P4SaMD backend.
   - `P4SAMD_API_KEY`: The secret key for authenticating with the P4SaMD backend.
   - `JOB_NAME`: The name of the job (used in callback URL).

## Folder Structure
Tests should follow a structured hierarchy:

```
repository-root/
├── test/
│   ├── category1/
│   │   ├── test1.spec.js
│   │   └── test2.spec.js
│   ├── category2/
│   │   ├── anotherTest.spec.js
│   │   └── exampleTest.spec.js
├── .env
├── package.json
├── run.sh
├── jest.config.js
└── test-results/
    └── junit.xml
```

### Explanation:
- **`test/`**: Root directory for all test files.
  - **Category Folders**: Tests belonging to the same category must be placed in their respective folders.
  - **Test Files**: Each test must be in a separate `.spec.js` file.
- **`.env`**: Environment variables file.
- **`run.sh`**: Script to run the tests and send results.
- **`test-results/`**: Directory where the test results (JUnit XML) are stored.

## How to Use

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Set Up Environment Variables**
   Create a `.env` file in the repository root with the following variables:
   ```env
   P4SAMD_BACKEND_HOST=https://example.com
   P4SAMD_API_KEY=your_secret_api_key
   JOB_NAME=example-job
   ```

4. **Write Your Tests**
   Create your Jest tests under the `test/` directory. Follow the folder structure described above.

   Example of a test file:
   ```javascript
   // test/category1/exampleTest.spec.js
   describe('Example Test', () => {
       it('should pass this test', () => {
           expect(1 + 1).toBe(2);
       });

       it('should fail this test', () => {
           expect(1 + 1).toBe(3);
       });
   });
   ```

5. **Run Tests**
   Execute the `run.sh` script:
   ```bash
   ./run.sh
   ```

   The script will:
   - Run the tests.
   - Generate a `junit.xml` file in the `test-results/` directory.
   - Send the results to the P4SaMD backend.

6. **Check Test Results**
   The results will be sent to the endpoint: 
   ```
   ${P4SAMD_BACKEND_HOST}/tests-results/callback/${JOB_NAME}
   ```

## Notes
- Ensure that every test file ends with `.spec.js`.
- Use meaningful folder and file names to categorize and describe the purpose of your tests.
- If the `test-results/junit.xml` file is not found after running the tests, ensure that Jest is configured to generate JUnit XML output (this is typically done in `jest.config.js`).
