
// This is all that is required to deploy your service to Nomad
@Library("github.com/team-telnyx/tlnx-ci-lib") _
kubernetesPython {
    service      = "telnyx-2fa"
    hostGroup    = "dev_k8s_no_hosts"
}

// If you want to deploy your service to autodeploy to both nomad and our existing infrastructure in dev
// then replace the section above with this:

// @Library("github.com/team-telnyx/tlnx-ci-lib") _
// makeNomad {
//    service      = "telnyx-2fa"
//    site         = "dc2"
//    // hostGroup is the tanker group you normally deploy to in dev
//    hostGroup    = "dev_v2backend_tankers"
//
//}


// pipeline {
//     agent any

//     environment {
//         SERVICE_NAME = 'telnyx-2fa'
//         TARGET_HOSTS = 'dev_messaging'
//         SLACK_CHANNEL = 'squad-messaging-jenk'
//         BLAMEES = sh(script: "bin/jenkins-slack-blame ${env.BUILD_URL}", returnStdout: true).trim()
//     }

//     stages {
//         stage('Build') {
//             steps {
//                 echo 'Building...'
//                 slackSend (
//                     channel: "${SLACK_CHANNEL}",
//                     color: "#738595",
//                     message: "Starting Job: ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)",
//                 )
//                 sh 'make'
//             }
//             post {
//                 failure {
//                     slackSend(
//                         channel: "${SLACK_CHANNEL}",
//                         color: "#fe0002",
//                         message: "Failed Build: ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>) ${BLAMEES}",
//                     )
//                 }
//             }
//         }
//         stage('Test') {
//             steps {
//                 echo 'Test'
//                 sh 'make integrate'
//             }
//             post {
//                 failure {
//                     slackSend(
//                         channel: "${SLACK_CHANNEL}",
//                         color: "#fe0002",
//                         message: "Failed Tests: ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>) ${BLAMEES}",
//                     )
//                 }
//             }
//         }
//         stage('Push to registry') {
//             steps {
//                 echo 'Pushing to registry'
//                 sh 'make push'
//             }
//             post {
//                 failure {
//                     slackSend(
//                         channel: "${SLACK_CHANNEL}",
//                         color: "#fe0002",
//                         message: "Failed Pushing: ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>) ${BLAMEES}",
//                     )
//                 }
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 echo 'Deploying...'
//                 ansiblePlaybook(
//                     installation: 'ansible2140',
//                     inventory: '/etc/ansible/hosts-all',
//                     playbook: '/etc/ansible/playbooks/autodeploy/pushnewcontainers_red_AT.yml',
//                     credentialsId: 'telnyx-jenkinsipa-credentials',
//                     extras: '-e "service=${SERVICE_NAME} targethosts=${TARGET_HOSTS}"'
//                 )
//             }
//             post {
//                 failure {
//                     slackSend(
//                         channel: "${SLACK_CHANNEL}",
//                         color: "#fe0002",
//                         message: "Failed Deployment: ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>) ${BLAMEES}",
//                     )
//                 }
//             }
//         }
//     }
//     post {
//         success {
//             slackSend (
//                 channel: "${SLACK_CHANNEL}",
//                 color: "#02c14d",
//                 message: "Success! ${env.JOB_NAME} #${env.BUILD_NUMBER}",
//             )
//         }
//     }
// }
