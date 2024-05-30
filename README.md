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

![arch.png](readme_assets%2Farch.png)
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

![jettons.png](readme_assets%2Fjettons.png)

- **NFT Collection Creation**: An NFT collection was created specifically for the airdrop.

![nft.png](readme_assets%2Fnft.png)

---

### BACKEND
The backend is structured through an API Gateway built on Buildship, with a database for controlling the execution of jobs for sending Jettons and NFTs on Supabase. Additionally, there are two Python microservices communicating with the blockchain through TonBridge.

### DATABASE ER-DIAGRAM

![er.png](readme_assets%2Fer.png)

<details>
<summary>Diagram code</summary>

```diagram code
airdrop_limit [icon: dollar-sign, color: blue] {
    id string pk
    value number
}

jetton_rewards_jobs [icon: layers, color: green] {
    id string
    createdAt timestamp
    updated_at timestamp
    address string
    status string
}

nft_rewards_jobs [icon: layers, color: green] {
    id string
    createdAt timestamp
    updated_at timestamp
    address string
    status string
}

users [icon: users, color: green] {
    id string pk
    createdAt timestamp
    address string
    is_claimed bool
}

transactions [icon: align-justify, color: green] {
    id string
    createdAt timestamp
    updated_at timestamp
    job id
    address string
    status string
}


users.address <> nft_rewards_jobs.address
users.address <> jetton_rewards_jobs.address
jetton_rewards_jobs.address <> transactions.job

```

</details>

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
[OPENAPI_SwaggerHub](https://app.swaggerhub.com/apis/IKUSTOVDEV/airdrop/1.0.0)

The API Gateway is built using a low-code system called Buildship. Its primary role is to act as a bridge between the main application on FlutterFlow and the microservices and database.

![api_ex.png](readme_assets%2Fapi_ex.png)

A small trick, since the free version has limitations on commands, it was decided to create one method via POST with actions, and depending on the action passed in the request body, different operations are performed. An example of such implementation is shown in the screenshot.

![apiactions.png](readme_assets%2Fapiactions.png)

---

## MAIN FLOWS
### Auth
The Client initiates the login by interacting with the WebApp. The WebApp, acting as an intermediary, communicates with Tonkeeper (wallet) and TonBlockchain (bridge) to establish a secure connection 

#### Demo

![auth-gif.gif](readme_assets%2Fauth-gif.gif)

#### Sequence diagram
 
![auth_seq.png](readme_assets%2Fauth_seq.png)

<details>
<summary>Diagram code</summary>

```diagram code
title Tonkeeper Login Process

Client [icon: user, color: blue] > WebApp [icon: smartphone, color: green]: Login
activate Client
activate WebApp
WebApp > TonBlockchain [icon: cloud, color: orange]: TonConnect init
activate TonBlockchain

TonBlockchain --> WebApp: Wallet connect settings
WebApp > Client: Display QR code
Client > Tonkeeper [icon: wallet, color: purple]: Scan QR
activate Tonkeeper
Tonkeeper > TonBlockchain: Wallet connection
deactivate Tonkeeper

TonBlockchain --> WebApp: Account info
deactivate TonBlockchain


deactivate WebApp
deactivate Client

```

</details>

### AIRDROP CLAIM
The airdrop claim process involves checking the user's status, generating jobs for transactions, followed by a redirect to the NFT page where the user can select an NFT and receive their unique asset.

#### Demo
#### Sequence diagram

![claim_seq.png](readme_assets%2Fclaim_seq.png)

<details>
<summary>Diagram code</summary>

```diagram code
title CLAIM FLOW
Client [icon: mobile, color:  yellow]
API [icon: server, color: purple, label: "API Gateway"]
db [icon: database, color: green, label: "Supabase"]
NFT [icon: tool, color: orange, label: "NFT Service"]
Jetton [icon: tool, color: orange, label: "Jetton Service"]
TON [icon: cube, color: blue]

Client > API: Get \checkUser
activate API
API > db: User request
activate db
db --> API: User result
deactivate db
API --> Client: Response \checkUser
deactivate API

Client > API: POST \createJobs
activate API

par [label: NFT jobs init] {
  API > db: Create nft jobs
 activate db
 db --> API: Jobs result 
 deactivate db
 }
and [label: Jetton jobs init] {
 API > db: Create jetton jobs
 activate db
 db --> API: Jobs result
 deactivate db
}
API -> Client: Response \createJobs
deactivate API

Client > API: POST \action {type: sendJettons}
activate API
API > db: Update jobs [in_progress status]
activate db
db --> API: Jobs result
deactivate db

API > Jetton: POST \sendMessage
activate Jetton
Jetton > TON: Send BOC
activate TON
TON > Jetton: Result BOC
deactivate TON
Jetton > API: Result \sendMessage
deactivate Jetton

API > db: Update jobs [completed status]
activate db
db --> API: result
deactivate db

API > db: Update limit
activate db
db --> API: result
deactivate db


API -> Client: redirect to NFT page
deactivate API

Client > API: GET \collection
activate API
API > NFT: GET \collection
activate NFT
NFT > TON: get collection items
activate TON
TON > NFT: items json
deactivate TON
NFT > API: response items
deactivate NFT
API > Client: result \collection
deactivate API
Client > Client: select NFT
Client > API: POST \action {type: sendNFT}

activate API
API > db: Update jobs [in_progress status]
activate db
db --> API: Jobs result
deactivate db

API > NFT: POST \sendMessage
activate NFT
NFT > TON: Send BOC
activate TON
TON > NFT: Result BOC
deactivate TON
NFT > API: Result \sendMessage
deactivate NFT

API > db: Update jobs [completed status]
activate db
db --> API: result
deactivate db
API > Client: result
deactivate API
```

</details>

[CUSTOM CODE](https://github.com/ikustow/ffdrop/tree/main/ffdrop_app/lib/custom_code/actions)

## My contacts
- [Telegram](https://t.me/ikustow)
- [Linkedin](https://www.linkedin.com/in/ikustow/)
- [Email](mailto:ikustov.dev@gmail.com)
