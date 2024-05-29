# Airdropper

# Description
Application designed to demonstrate a Proof of Concept (PoC) for airdrop in the TON blockchain ecosystem.

### Key Features
- **Participation in Airdrop**: By participating in the airdrop, users receive tokens and unique NFT cards that verify their participation and can be used in further interactions within the ecosystem.
- **Unique NFT Cards**: Each NFT card is unique and can be collected, traded, or sold on internal or external markets.
- **User-Friendly Interface**: The application is developed on the FlutterFlow platform, providing high performance, responsive design, and an easy-to-use interface.
### Technical Specifications
- **FlutterFlow Platform**: Utilizing FlutterFlow allows for the rapid development and deployment of cross-platform applications with a single codebase for iOS and Android.
- **Backend on Buildship and Custom Microservices**: A reliable and scalable backend that ensures high performance and security of all operations. The microservices architecture allows for easy addition of new features and integrations.
### Advantages
- **Security and Transparency**: The use of blockchain technology ensures a high level of security and transparency for all transactions.
- **Ease of Use**: With an intuitive interface and thoughtful navigation, users can easily participate in the airdrop and manage their assets.
- **TON Ecosystem**: The application is integrated with the TON ecosystem, providing access to a wide range of opportunities and services based on this blockchain platform.
---

Application Architecture 

| **Aspect** | **Tool** |
| ----- | ----- |
| Development | FlutterFlow |
| Custom code | Dart |
| Blockchain integration | TonConnect |
| Dart library | DartTonConnect |
| Wallet | TonKeeper |
| NFT Service | [﻿github.com/ikustow/sender](https://github.com/ikustow/sender)  |
| Jetton Service | [﻿github.com/ikustow/jettonflow](https://github.com/ikustow/jettonflow)  |
| API Gateway | Biuldship |
| Database | Supabase |
[﻿View on canvas](https://app.eraser.io/workspace/t0KhFUgNuJQAzSI9y2XA?elements=_Rv_DoQ1YVuTODDTM1ZTqQ) 

---

### USER STORIES
#### User Story 1: Check User
**As a** registered user,**I want to** check if my account is valid,**so that** I can proceed with creating and managing jobs.

#### User Story 2: Create Jobs
**As a** registered user, **I want to** create NFT and Jetton jobs, **so that** I can start using the services provided.

#### User Story 3: Send Jettons
**As a** registered user, **I want to** send Jettons, **so that** I can transfer digital assets securely.

#### User Story 4: Get NFT Collection
**As a** registered user, **I want to** view my NFT collection, **so that** I can manage and interact with my digital assets.

#### User Story 5: Send NFT
**As a** registered user, **I want to** send an NFT to another user, **so that** I can transfer ownership of my digital assets.

## Use Cases
| Use Case ID | Use Case Name | Actor | Description | Precondition | Postcondition |
| ----- | ----- | ----- | ----- | ----- | ----- |
| UC1 | Check User | Client | The client sends a request to check the user via API Gateway. | User not checked | Receive user check result |
| UC2 | Create Jobs | Client | The client sends a request to create jobs via API Gateway. | User checked | NFT and Jetton jobs created |
| UC3 | Send Jettons | Client | The client initiates sending Jettons via API Gateway. | Jetton jobs created | Jettons sent, job status updated |
| UC4 | Redirect to NFT Page | API | API redirects the client to the NFT page after sending Jettons. | Jettons sent | Client on the NFT page |
| UC5 | Get Collection | Client | The client requests the NFT collection via API Gateway. | Client on the NFT page | Receive NFT collection |
| UC6 | Send NFT | Client | The client initiates sending NFT via API Gateway. | NFT selected | NFT sent, job status updated |
### What Has Been Done So Far
- **Custom Token Deployment**: A custom token was deployed using a standard token contract.
здесь картинка

- **NFT Collection Creation**: An NFT collection was created specifically for the airdrop.
здесь картинка

---

### BACKEND
The backend is structured through an API Gateway built on Buildship, with a database for controlling the execution of jobs for sending Jettons and NFTs on Supabase. Additionally, there are two Python microservices communicating with the blockchain through TonBridge.

### DATABASE ER-DIAGRAM
Картинка

Brief description of the database schema:

- **airdrop_limit:** Stores information about airdrop limits, including ID and value.
- **jetton_rewards_jobs:** Tracks Jetton rewards jobs, including details like ID, creation time, update time, associated address, and job status.
- **nft_rewards_jobs:** Manages NFT rewards jobs, with attributes such as ID, creation time, update time, associated address, and job status.
- **users:** Contains user data, such as ID, creation time, user address, and a flag indicating if the user has claimed rewards.
- **transactions:** Records transaction details, including ID, creation time, update time, associated job ID, user address, and transaction status.
The relationships in the database are as follows:

- Each user's address corresponds to addresses in the NFT rewards jobs and Jetton rewards jobs tables.
- Jetton rewards jobs are associated with transactions through the job ID field.
### MICROSERVICES
Two Python microservices have been implemented, one of which is responsible for handling Jettons, while the other deals with NFTs.

You can research them using the following links to the repositories.

| Name | Link |
| ----- | ----- |
| NFT Service | [﻿github.com/ikustow/sender](https://github.com/ikustow/sender)  |
| Jetton Service | [﻿github.com/ikustow/jettonflow](https://github.com/ikustow/jettonflow)  |
### API GATAWAY DESCRIPTION
The API Gateway is built using a low-code system called Buildship. Its primary role is to act as a bridge between the main application on FlutterFlow and the microservices and database.



Картиника

A small trick, since the free version has limitations on commands, it was decided to create one method via POST with actions, and depending on the action passed in the request body, different operations are performed. An example of such implementation is shown in the screenshot.

картинка

---

## MAIN FLOWS
### Auth
The Client initiates the login by interacting with the WebApp. The WebApp, acting as an intermediary, communicates with Tonkeeper (wallet) and TonBlockchain (bridge) to establish a secure connection 

#### Demo
#### Sequence diagram
 

### AIRDROP CLAIM
The airdrop claim process involves checking the user's status, generating jobs for transactions, followed by a redirect to the NFT page where the user can select an NFT and receive their unique asset.

#### Demo
#### Sequence diagram


